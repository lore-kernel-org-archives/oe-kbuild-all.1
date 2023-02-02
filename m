Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E487EA2C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 02:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675303626; x=1706839626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xraoehnHq4LR1PNnBjHTouk9i+aPej3xmUD09B/NZC0=;
  b=MZto5t1tdXRpX4OpDmCxz0TztCxej91mHEsdXB8Ne61FORBHDxzDixjV
   TpiAWhHzODSqbHf+9m35OszvFIfK9parnUbWxJmcfZKHOQRuFnvOlj455
   o5bqZWg7Ie2E9QwNeCO+lLZTjqU+Dc9bB15mqg1iqvBev2DZ29KrqPLSg
   UcQKH8SbeWVIpa5UqgK6F6FxBHbyQSw3mlrcfwqYqlCmUC1OAjl3DUAFN
   0Y29wozEH/vfYqdchSAe+6Kaa2qrSMQabAsNiZzZ6IT0kMNfsiyTqo2nS
   5EO7ty6cqvV+j0xx31+uHip+BPsgJea+bhoYNB//LZAQuAm8BmynwrKff
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326028778"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="326028778"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993900136"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="993900136"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 18:07:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNP0A-00061S-1Z;
	Thu, 02 Feb 2023 02:07:02 +0000
Date: Thu, 2 Feb 2023 10:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 5/9]
 arch/x86/kernel/smpboot.c:1251:5: warning: no previous prototype for
 'do_cpu_up'
Message-ID: <202302021011.Db4Od62h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/paronl.2023.02.01a
head:   05792727280c094a8dcd1aa4950a61a2d214ddb8
commit: 9d418800f17cbc141c9ec5772e4d34c4c7b67936 [5/9] x86/smpboot: Split up native_cpu_up into separate phases and document them
config: x86_64-randconfig-a001-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021011.Db4Od62h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/9d418800f17cbc141c9ec5772e4d34c4c7b67936
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 9d418800f17cbc141c9ec5772e4d34c4c7b67936
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smpboot.c:1251:5: warning: no previous prototype for 'do_cpu_up' [-Wmissing-prototypes]
    1251 | int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
         |     ^~~~~~~~~


vim +/do_cpu_up +1251 arch/x86/kernel/smpboot.c

  1250	
> 1251	int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
  1252	{
  1253		int apicid = apic->cpu_present_to_apicid(cpu);
  1254		int cpu0_nmi_registered = 0;
  1255		int err, ret = 0;
  1256	
  1257		lockdep_assert_irqs_enabled();
  1258	
  1259		pr_debug("++++++++++++++++++++=_---CPU UP  %u\n", cpu);
  1260	
  1261		if (apicid == BAD_APICID ||
  1262		    !physid_isset(apicid, phys_cpu_present_map) ||
  1263		    !apic->apic_id_valid(apicid)) {
  1264			pr_err("%s: bad cpu %d\n", __func__, cpu);
  1265			return -EINVAL;
  1266		}
  1267	
  1268		/*
  1269		 * Already booted CPU?
  1270		 */
  1271		if (cpumask_test_cpu(cpu, cpu_callin_mask)) {
  1272			pr_debug("do_boot_cpu %d Already started\n", cpu);
  1273			return -ENOSYS;
  1274		}
  1275	
  1276		/*
  1277		 * Save current MTRR state in case it was changed since early boot
  1278		 * (e.g. by the ACPI SMI) to initialize new CPUs with MTRRs in sync:
  1279		 */
  1280		mtrr_save_state();
  1281	
  1282		/* x86 CPUs take themselves offline, so delayed offline is OK. */
  1283		err = cpu_check_up_prepare(cpu);
  1284		if (err && err != -EBUSY)
  1285			return err;
  1286	
  1287		/* the FPU context is blank, nobody can own it */
  1288		per_cpu(fpu_fpregs_owner_ctx, cpu) = NULL;
  1289	
  1290		err = common_cpu_up(cpu, tidle);
  1291		if (err)
  1292			return err;
  1293	
  1294		err = do_boot_cpu(apicid, cpu, tidle, &cpu0_nmi_registered);
  1295		if (err) {
  1296			pr_err("do_boot_cpu failed(%d) to wakeup CPU#%u\n", err, cpu);
  1297			ret = -EIO;
  1298			goto unreg_nmi;
  1299		}
  1300	
  1301	unreg_nmi:
  1302		/*
  1303		 * Clean up the nmi handler. Do this after the callin and callout sync
  1304		 * to avoid impact of possible long unregister time.
  1305		 */
  1306		if (cpu0_nmi_registered)
  1307			unregister_nmi_handler(NMI_LOCAL, "wake_cpu0");
  1308	
  1309		return ret;
  1310	}
  1311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
