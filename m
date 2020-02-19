Content-Type: multipart/mixed; boundary="===============5952867813666704561=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:core/rcu 3/14] arch/x86/kernel/cpu/mce/core.c:1257:2: error: implicit declaration of function 'nmi_enter'; did you mean 'oops_enter'?
Date: Thu, 20 Feb 2020 03:02:55 +0800
Message-ID: <202002200340.49JEYS7Y%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5952867813666704561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git co=
re/rcu
head:   57568d29563b0c8ea8a60458c049a6800b4987b7
commit: 1b0f7ed31b668c0df499b81775cf6d5f966327ba [3/14] x86: Replace ist_en=
ter() with nmi_enter()
config: i386-alldefconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        git checkout 1b0f7ed31b668c0df499b81775cf6d5f966327ba
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/core.c: In function 'do_machine_check':
>> arch/x86/kernel/cpu/mce/core.c:1257:2: error: implicit declaration of fu=
nction 'nmi_enter'; did you mean 'oops_enter'? [-Werror=3Dimplicit-function=
-declaration]
     nmi_enter();
     ^~~~~~~~~
     oops_enter
   arch/x86/kernel/cpu/mce/core.c:1353:24: error: invalid type argument of =
'->' (have 'struct mce')
      current->mce_addr =3D m->addr;
                           ^~
   arch/x86/kernel/cpu/mce/core.c:1354:26: error: invalid type argument of =
'->' (have 'struct mce')
      current->mce_status =3D m->mcgstatus;
                             ^~
   arch/x86/kernel/cpu/mce/core.c:1359:3: error: implicit declaration of fu=
nction 'task_work_add'; did you mean 'task_lock'? [-Werror=3Dimplicit-funct=
ion-declaration]
      task_work_add(current, &current->mce_kill_me, true);
      ^~~~~~~~~~~~~
      task_lock
>> arch/x86/kernel/cpu/mce/core.c:1366:2: error: implicit declaration of fu=
nction 'nmi_exit'; did you mean 'do_exit'? [-Werror=3Dimplicit-function-dec=
laration]
     nmi_exit();
     ^~~~~~~~
     do_exit
   cc1: some warnings being treated as errors

vim +1257 arch/x86/kernel/cpu/mce/core.c

  1210	=

  1211	/*
  1212	 * The actual machine check handler. This only handles real
  1213	 * exceptions when something got corrupted coming in through int 18.
  1214	 *
  1215	 * This is executed in NMI context not subject to normal locking rul=
es. This
  1216	 * implies that most kernel services cannot be safely used. Don't ev=
en
  1217	 * think about putting a printk in there!
  1218	 *
  1219	 * On Intel systems this is entered on all CPUs in parallel through
  1220	 * MCE broadcast. However some CPUs might be broken beyond repair,
  1221	 * so be always careful when synchronizing with others.
  1222	 */
  1223	notrace void do_machine_check(struct pt_regs *regs, long error_code)
  1224	{
  1225		DECLARE_BITMAP(valid_banks, MAX_NR_BANKS);
  1226		DECLARE_BITMAP(toclear, MAX_NR_BANKS);
  1227		struct mca_config *cfg =3D &mca_cfg;
  1228		int cpu =3D smp_processor_id();
  1229		struct mce m, *final;
  1230		char *msg =3D NULL;
  1231		int worst =3D 0;
  1232	=

  1233		/*
  1234		 * Establish sequential order between the CPUs entering the machine
  1235		 * check handler.
  1236		 */
  1237		int order =3D -1;
  1238	=

  1239		/*
  1240		 * If no_way_out gets set, there is no safe way to recover from this
  1241		 * MCE.  If mca_cfg.tolerant is cranked up, we'll try anyway.
  1242		 */
  1243		int no_way_out =3D 0;
  1244	=

  1245		/*
  1246		 * If kill_it gets set, there might be a way to recover from this
  1247		 * error.
  1248		 */
  1249		int kill_it =3D 0;
  1250	=

  1251		/*
  1252		 * MCEs are always local on AMD. Same is determined by MCG_STATUS_L=
MCES
  1253		 * on Intel.
  1254		 */
  1255		int lmce =3D 1;
  1256	=

> 1257		nmi_enter();
  1258	=

  1259		if (__mc_check_crashing_cpu(cpu))
  1260			goto out;
  1261	=

  1262		this_cpu_inc(mce_exception_count);
  1263	=

  1264		mce_gather_info(&m, regs);
  1265		m.tsc =3D rdtsc();
  1266	=

  1267		final =3D this_cpu_ptr(&mces_seen);
  1268		*final =3D m;
  1269	=

  1270		memset(valid_banks, 0, sizeof(valid_banks));
  1271		no_way_out =3D mce_no_way_out(&m, &msg, valid_banks, regs);
  1272	=

  1273		barrier();
  1274	=

  1275		/*
  1276		 * When no restart IP might need to kill or panic.
  1277		 * Assume the worst for now, but if we find the
  1278		 * severity is MCE_AR_SEVERITY we have other options.
  1279		 */
  1280		if (!(m.mcgstatus & MCG_STATUS_RIPV))
  1281			kill_it =3D 1;
  1282	=

  1283		/*
  1284		 * Check if this MCE is signaled to only this logical processor,
  1285		 * on Intel, Zhaoxin only.
  1286		 */
  1287		if (m.cpuvendor =3D=3D X86_VENDOR_INTEL ||
  1288		    m.cpuvendor =3D=3D X86_VENDOR_ZHAOXIN)
  1289			lmce =3D m.mcgstatus & MCG_STATUS_LMCES;
  1290	=

  1291		/*
  1292		 * Local machine check may already know that we have to panic.
  1293		 * Broadcast machine check begins rendezvous in mce_start()
  1294		 * Go through all banks in exclusion of the other CPUs. This way we
  1295		 * don't report duplicated events on shared banks because the first=
 one
  1296		 * to see it will clear it.
  1297		 */
  1298		if (lmce) {
  1299			if (no_way_out)
  1300				mce_panic("Fatal local machine check", &m, msg);
  1301		} else {
  1302			order =3D mce_start(&no_way_out);
  1303		}
  1304	=

  1305		__mc_scan_banks(&m, final, toclear, valid_banks, no_way_out, &worst=
);
  1306	=

  1307		if (!no_way_out)
  1308			mce_clear_state(toclear);
  1309	=

  1310		/*
  1311		 * Do most of the synchronization with other CPUs.
  1312		 * When there's any problem use only local no_way_out state.
  1313		 */
  1314		if (!lmce) {
  1315			if (mce_end(order) < 0)
  1316				no_way_out =3D worst >=3D MCE_PANIC_SEVERITY;
  1317		} else {
  1318			/*
  1319			 * If there was a fatal machine check we should have
  1320			 * already called mce_panic earlier in this function.
  1321			 * Since we re-read the banks, we might have found
  1322			 * something new. Check again to see if we found a
  1323			 * fatal error. We call "mce_severity()" again to
  1324			 * make sure we have the right "msg".
  1325			 */
  1326			if (worst >=3D MCE_PANIC_SEVERITY && mca_cfg.tolerant < 3) {
  1327				mce_severity(&m, cfg->tolerant, &msg, true);
  1328				mce_panic("Local fatal machine check!", &m, msg);
  1329			}
  1330		}
  1331	=

  1332		/*
  1333		 * If tolerant is at an insane level we drop requests to kill
  1334		 * processes and continue even when there is no way out.
  1335		 */
  1336		if (cfg->tolerant =3D=3D 3)
  1337			kill_it =3D 0;
  1338		else if (no_way_out)
  1339			mce_panic("Fatal machine check on current CPU", &m, msg);
  1340	=

  1341		if (worst > 0)
  1342			irq_work_queue(&mce_irq_work);
  1343	=

  1344		mce_wrmsrl(MSR_IA32_MCG_STATUS, 0);
  1345	=

  1346		sync_core();
  1347	=

  1348		if (worst !=3D MCE_AR_SEVERITY && !kill_it)
  1349			goto out;
  1350	=

  1351		/* Fault was in user mode and we need to take some action */
  1352		if ((m.cs & 3) =3D=3D 3) {
  1353			current->mce_addr =3D m->addr;
  1354			current->mce_status =3D m->mcgstatus;
  1355			current->mce_kill_me.func =3D mce_kill_me_maybe;
  1356			if (kill_it)
  1357				current->mce_kill_me.func =3D mce_kill_me_now;
  1358	=

  1359			task_work_add(current, &current->mce_kill_me, true);
  1360		} else {
  1361			if (!fixup_exception(regs, X86_TRAP_MC, error_code, 0))
  1362				mce_panic("Failed kernel mode recovery", &m, msg);
  1363		}
  1364	=

  1365	out:
> 1366		nmi_exit();
  1367	}
  1368	EXPORT_SYMBOL_GPL(do_machine_check);
  1369	NOKPROBE_SYMBOL(do_machine_check);
  1370	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5952867813666704561==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
IuwWTSUkg6SRR/rg2urZ6rRC+z9ZlQMLwJ0AAA==
--===============5952867813666704561==--

