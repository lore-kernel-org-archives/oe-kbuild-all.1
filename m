Content-Type: multipart/mixed; boundary="===============0531972102346810821=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mel:sched-sisrewrite-v1r3 8/13] kernel/sched/fair.c:6022:12: error: implicit declaration of function 'alt_smt_target'
Date: Wed, 26 Feb 2020 08:04:12 +0800
Message-ID: <202002260858.sfLDHvJd%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0531972102346810821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git sched=
-sisrewrite-v1r3
head:   cb9492ad9bd4da41afa994fbe26eac85672b2daa
commit: f7d043ea8d025283166688f3376867885bffcfef [8/13] sched/fair: Search =
for an idle sibling in a single pass
config: mips-malta_kvm_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 5.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout f7d043ea8d025283166688f3376867885bffcfef
        # save the attached .config to linux build tree
        GCC_VERSION=3D5.5.0 make.cross ARCH=3Dmips =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'sis_start_target':
>> kernel/sched/fair.c:6022:12: error: implicit declaration of function 'al=
t_smt_target' [-Werror=3Dimplicit-function-declaration]
      target =3D alt_smt_target(cpus, target);
               ^
   kernel/sched/fair.c: In function 'select_idle_cpu':
>> kernel/sched/fair.c:6140:3: error: implicit declaration of function 'set=
_idle_cores' [-Werror=3Dimplicit-function-declaration]
      set_idle_cores(target, 0);
      ^
   cc1: some warnings being treated as errors

vim +/alt_smt_target +6022 kernel/sched/fair.c

  6017	=

  6018	static int sis_start_target(struct cpumask *cpus, bool find_idle_cor=
e,
  6019				    int target)
  6020	{
  6021		if (!find_idle_core)
> 6022			target =3D alt_smt_target(cpus, target);
  6023	=

  6024		return target + 1;
  6025	}
  6026	=

  6027	/*
  6028	 * Scan the LLC domain for idle CPUs; this is dynamically regulated =
by
  6029	 * the success of failure of previous scans.
  6030	 */
  6031	static int select_idle_cpu(struct task_struct *p, struct sched_domai=
n *sd,
  6032				   int *fast_targets, int nr_fast)
  6033	{
  6034		struct cpumask *cpus =3D this_cpu_cpumask_var_ptr(select_idle_mask);
  6035		struct sched_domain_shared *sds;
  6036		int i, nr_scanned =3D 0, nr_running =3D 0;
  6037		int cpu, idle_candidate =3D -1, idle_core =3D -1;
  6038		unsigned int nr =3D sd->span_weight;
  6039		unsigned int min_depth =3D 4, depth =3D nr;
  6040		bool find_idle_core;
  6041		int target =3D fast_targets[0];
  6042	=

  6043		sds =3D rcu_dereference(per_cpu(sd_llc_shared, target));
  6044		if (!sds)
  6045			return -1;
  6046	=

  6047		if (abort_sd_overloaded(sds, fast_targets, nr_fast))
  6048			return -1;
  6049	=

  6050		/* Reset candidate CPUs */
  6051		cpumask_and(cpus, sched_domain_span(sd), p->cpus_ptr);
  6052	=

  6053		/*
  6054		 * Slow path, account for the fast_target scans and move past the
  6055		 * CPUs already checked.
  6056		 */
  6057		for (i =3D 0; i < nr_fast; i++) {
  6058			nr_scanned++;
  6059			nr_running +=3D cpu_rq(fast_targets[i])->nr_running;
  6060			target =3D max(target, fast_targets[i]);
  6061		}
  6062	=

  6063		/* Limit depth based on CPUs scanned already */
  6064		if (sched_feat(SIS_DEPTH)) {
  6065			depth =3D READ_ONCE(sd->sis_scan_depth);
  6066			depth =3D clamp(depth, min_depth, nr);
  6067			nr =3D depth;
  6068		}
  6069	=

  6070		/*
  6071		 * Scan all CPUs in the domain starting with one after the target.
  6072		 * The target and its core are definitely not free.
  6073		 */
  6074		find_idle_core =3D test_idle_cores(target, false);
  6075		for_each_cpu_wrap(cpu, cpus, sis_start_target(cpus, find_idle_core,=
 target)) {
  6076			int smt;
  6077			bool core_is_idle;
  6078	=

  6079			/* Scan each sibling */
  6080			core_is_idle =3D true;
  6081			for_each_smt(smt, cpu_smt_mask(cpu)) {
  6082	=

  6083				if (!nr) {
  6084					cpu =3D idle_candidate;
  6085					goto out;
  6086				}
  6087				nr--;
  6088	=

  6089				schedstat_inc(this_rq()->sis_scanned);
  6090				nr_scanned++;
  6091				if (!available_idle_cpu(smt)) {
  6092					nr_running +=3D cpu_rq(smt)->nr_running;
  6093					core_is_idle =3D false;
  6094	=

  6095					/* Not a free core but maybe a candidate */
  6096					if (!sched_idle_cpu(smt))
  6097						continue;
  6098				}
  6099	=

  6100				if (idle_candidate =3D=3D -1 && cpumask_test_cpu(cpu, p->cpus_ptr=
)) {
  6101					idle_candidate =3D smt;
  6102	=

  6103					/* Any CPU if an idle core is not required */
  6104					if (!find_idle_core) {
  6105						cpu =3D idle_candidate;
  6106						goto out;
  6107					}
  6108				}
  6109			}
  6110	=

  6111			/*
  6112			 * If the core is idle, it implies find_idle_core is true as
  6113			 * otherwise the SMT loop would have broke out already
  6114			 */
  6115			if (core_is_idle) {
  6116				idle_core =3D cpu;
  6117				break;
  6118			}
  6119	=

  6120			/*
  6121			 * Abort if CPUs are overloaded. Either the load balancer
  6122			 * cannot cope or the task is running on a restricted set
  6123			 * of CPUs that cannot be balanced. Chances of finding an
  6124			 * idle core are much reduced.
  6125			 */
  6126			if (sched_feat(SIS_OVERLOAD) && nr_running >=3D (nr_scanned << 1))=
 {
  6127				set_sd_overloaded(sds, 1);
  6128				cpu =3D idle_candidate;
  6129				goto out;
  6130			}
  6131	=

  6132			/* Do not repeat scan of SMT siblings */
  6133			sis_clear_smt_mask(cpu, cpus);
  6134		}
  6135	=

  6136		/* Did an idle core search fail? */
  6137		if (find_idle_core && idle_core =3D=3D -1) {
  6138	=

  6139			/* Stop searching */
> 6140			set_idle_cores(target, 0);
  6141	=

  6142			/* Use an idle candidate if another was not found */
  6143			if ((signed)cpu >=3D nr_cpumask_bits)
  6144				cpu =3D idle_candidate;
  6145		}
  6146	=

  6147	out:
  6148		if (sched_feat(SIS_DEPTH)) {
  6149			if ((signed)cpu >=3D nr_cpumask_bits)
  6150				depth--;
  6151			else
  6152				depth +=3D nr ? nr : 1;
  6153			depth =3D clamp(depth, min_depth, sd->span_weight);
  6154			WRITE_ONCE(sd->sis_scan_depth, depth);
  6155		}
  6156	=

  6157		if ((signed)cpu < nr_cpumask_bits && nr_running < (nr_scanned << 1))
  6158			set_sd_overloaded(sds, 0);
  6159	=

  6160		return cpu;
  6161	}
  6162	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============0531972102346810821==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
DFQBAA==
--===============0531972102346810821==--

