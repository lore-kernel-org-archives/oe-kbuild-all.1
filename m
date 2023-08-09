Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65CD2452D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 20:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691613165; x=1723149165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fT6uPZmoydgrZR9wnwoh6b1qfvtpMq7BnexFBmiAbWY=;
  b=j09ca9zAlLT0PPVxeguRb2uF93YrOBzqcMZalnD5T7e/8gi3LcG9ROGf
   4R3VCuqTyLVDKlVefEbHb8ZpxOvWH6Dzkuh92988WnGlyY/p02ZiEYHDA
   c416hq3y9ZfjtB1S3PENFf5EdRSB1Q7kEbWYTDcmt/jYlWCXh2q6n4BhR
   RSaBFBMHA9CEzIThL36Z32Oc1nvfARVO5VOR/yOmEyaytT8OMZmfrvH8A
   wKMff4zgQDsd3wnohXCCC1LLSCYcHAQBo9+HmgHVkAhREI8S004MsbTcK
   C50F8cMB0WLRAdY7yO8SeA2dJwC/BB4OWzSAxxNOfmxd8yjmoLicQbVBJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="351529134"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="351529134"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 13:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="735149949"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="735149949"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2023 13:32:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTprG-0006NE-2i;
	Wed, 09 Aug 2023 20:32:42 +0000
Date: Thu, 10 Aug 2023 04:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 12/17] arch/x86/kernel/cpu/bugs.c:1096:
 undefined reference to `srso_alias_return_thunk'
Message-ID: <202308100417.OBZdlTg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/srso
head:   c11a8b2bc1bb3ad76d8d28b283552768d665208c
commit: 5ea91c46f6a18720af332166f85544c31886dcdb [12/17] x86/cpu: Rename original retbleed methods
config: i386-randconfig-i002-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100417.OBZdlTg6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100417.OBZdlTg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100417.OBZdlTg6-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/bugs.o: in function `retbleed_select_mitigation':
>> arch/x86/kernel/cpu/bugs.c:1096: undefined reference to `srso_alias_return_thunk'
   ld: arch/x86/kernel/cpu/bugs.c:1095: undefined reference to `x86_return_thunk'
   ld: arch/x86/kernel/cpu/bugs.c:1101: undefined reference to `srso_return_thunk'
   ld: arch/x86/kernel/cpu/bugs.c:1092: undefined reference to `retbleed_return_thunk'


vim +1096 arch/x86/kernel/cpu/bugs.c

7fbf47c7ce50b3 Alexandre Chartre             2022-06-14   980  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14   981  static void __init retbleed_select_mitigation(void)
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14   982  {
3ebc170068885b Peter Zijlstra                2022-06-14   983  	bool mitigate_smt = false;
953a4955188e0e Peter Zijlstra                2023-08-07   984  	bool has_microcode = false;
3ebc170068885b Peter Zijlstra                2022-06-14   985  
953a4955188e0e Peter Zijlstra                2023-08-07   986  	if ((!boot_cpu_has_bug(X86_BUG_RETBLEED) && !boot_cpu_has_bug(X86_BUG_SRSO)) ||
953a4955188e0e Peter Zijlstra                2023-08-07   987  	    cpu_mitigations_off())
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14   988  		return;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14   989  
953a4955188e0e Peter Zijlstra                2023-08-07   990  	if (boot_cpu_has_bug(X86_BUG_SRSO)) {
953a4955188e0e Peter Zijlstra                2023-08-07   991  		has_microcode = boot_cpu_has(X86_FEATURE_IBPB_BRTYPE) || cpu_has_ibpb_brtype_microcode();
953a4955188e0e Peter Zijlstra                2023-08-07   992  		if (!has_microcode) {
953a4955188e0e Peter Zijlstra                2023-08-07   993  			pr_warn("IBPB-extending microcode not applied!\n");
953a4955188e0e Peter Zijlstra                2023-08-07   994  			pr_warn(RETBLEED_SRSO_NOTICE);
953a4955188e0e Peter Zijlstra                2023-08-07   995  		} else {
953a4955188e0e Peter Zijlstra                2023-08-07   996  			/*
953a4955188e0e Peter Zijlstra                2023-08-07   997  			 * Enable the synthetic (even if in a real CPUID leaf)
953a4955188e0e Peter Zijlstra                2023-08-07   998  			 * flags for guests.
953a4955188e0e Peter Zijlstra                2023-08-07   999  			 */
953a4955188e0e Peter Zijlstra                2023-08-07  1000  			setup_force_cpu_cap(X86_FEATURE_IBPB_BRTYPE);
953a4955188e0e Peter Zijlstra                2023-08-07  1001  			setup_force_cpu_cap(X86_FEATURE_SBPB);
953a4955188e0e Peter Zijlstra                2023-08-07  1002  
953a4955188e0e Peter Zijlstra                2023-08-07  1003  			/*
953a4955188e0e Peter Zijlstra                2023-08-07  1004  			 * Zen1/2 with SMT off aren't vulnerable after the right
953a4955188e0e Peter Zijlstra                2023-08-07  1005  			 * IBPB microcode has been applied.
953a4955188e0e Peter Zijlstra                2023-08-07  1006  			 */
953a4955188e0e Peter Zijlstra                2023-08-07  1007  			if ((boot_cpu_data.x86 < 0x19) &&
953a4955188e0e Peter Zijlstra                2023-08-07  1008  			    (cpu_smt_control == CPU_SMT_DISABLED))
953a4955188e0e Peter Zijlstra                2023-08-07  1009  				setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
953a4955188e0e Peter Zijlstra                2023-08-07  1010  		}
953a4955188e0e Peter Zijlstra                2023-08-07  1011  	}
953a4955188e0e Peter Zijlstra                2023-08-07  1012  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1013  	switch (retbleed_cmd) {
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1014  	case RETBLEED_CMD_OFF:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1015  		return;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1016  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1017  	case RETBLEED_CMD_UNRET:
953a4955188e0e Peter Zijlstra                2023-08-07  1018  	case RETBLEED_CMD_UNRET_SRSO:
953a4955188e0e Peter Zijlstra                2023-08-07  1019  	case RETBLEED_CMD_UNRET_SRSO_ALIAS:
f43b9876e857c7 Peter Zijlstra                2022-06-27  1020  		if (IS_ENABLED(CONFIG_CPU_UNRET_ENTRY)) {
953a4955188e0e Peter Zijlstra                2023-08-07  1021  			if (retbleed_cmd == RETBLEED_CMD_UNRET)
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1022  				retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
953a4955188e0e Peter Zijlstra                2023-08-07  1023  			if (retbleed_cmd == RETBLEED_CMD_UNRET_SRSO)
953a4955188e0e Peter Zijlstra                2023-08-07  1024  				retbleed_mitigation = RETBLEED_MITIGATION_UNRET_SRSO;
953a4955188e0e Peter Zijlstra                2023-08-07  1025  			if (retbleed_cmd == RETBLEED_CMD_UNRET_SRSO_ALIAS)
953a4955188e0e Peter Zijlstra                2023-08-07  1026  				retbleed_mitigation = RETBLEED_MITIGATION_UNRET_SRSO_ALIAS;
f43b9876e857c7 Peter Zijlstra                2022-06-27  1027  		} else {
f43b9876e857c7 Peter Zijlstra                2022-06-27  1028  			pr_err("WARNING: kernel not compiled with CPU_UNRET_ENTRY.\n");
f43b9876e857c7 Peter Zijlstra                2022-06-27  1029  			goto do_cmd_auto;
f43b9876e857c7 Peter Zijlstra                2022-06-27  1030  		}
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1031  		break;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1032  
3ebc170068885b Peter Zijlstra                2022-06-14  1033  	case RETBLEED_CMD_IBPB:
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1034  	case RETBLEED_CMD_IBPB_VMEXIT:
2259da159fbe5d Thadeu Lima de Souza Cascardo 2022-07-07  1035  		if (!boot_cpu_has(X86_FEATURE_IBPB)) {
2259da159fbe5d Thadeu Lima de Souza Cascardo 2022-07-07  1036  			pr_err("WARNING: CPU does not support IBPB.\n");
2259da159fbe5d Thadeu Lima de Souza Cascardo 2022-07-07  1037  			goto do_cmd_auto;
b5d4262fb3d781 Peter Zijlstra                2023-08-07  1038  		} else {
953a4955188e0e Peter Zijlstra                2023-08-07  1039  			if (boot_cpu_has_bug(X86_BUG_SRSO) && !has_microcode)
953a4955188e0e Peter Zijlstra                2023-08-07  1040  				pr_err("IBPB-extending microcode not applied; SRSO NOT mitigated\n");
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1041  			if (retbleed_cmd == RETBLEED_CMD_IBPB)
3ebc170068885b Peter Zijlstra                2022-06-14  1042  				retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1043  			if (retbleed_cmd == RETBLEED_CMD_IBPB_VMEXIT)
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1044  				retbleed_mitigation = RETBLEED_MITIGATION_IBPB_VMEXIT;
f43b9876e857c7 Peter Zijlstra                2022-06-27  1045  		}
3ebc170068885b Peter Zijlstra                2022-06-14  1046  		break;
3ebc170068885b Peter Zijlstra                2022-06-14  1047  
d82a0345cf218f Thomas Gleixner               2022-09-15  1048  	case RETBLEED_CMD_STUFF:
d82a0345cf218f Thomas Gleixner               2022-09-15  1049  		if (IS_ENABLED(CONFIG_CALL_DEPTH_TRACKING) &&
d82a0345cf218f Thomas Gleixner               2022-09-15  1050  		    spectre_v2_enabled == SPECTRE_V2_RETPOLINE) {
d82a0345cf218f Thomas Gleixner               2022-09-15  1051  			retbleed_mitigation = RETBLEED_MITIGATION_STUFF;
d82a0345cf218f Thomas Gleixner               2022-09-15  1052  
d82a0345cf218f Thomas Gleixner               2022-09-15  1053  		} else {
d82a0345cf218f Thomas Gleixner               2022-09-15  1054  			if (IS_ENABLED(CONFIG_CALL_DEPTH_TRACKING))
d82a0345cf218f Thomas Gleixner               2022-09-15  1055  				pr_err("WARNING: retbleed=stuff depends on spectre_v2=retpoline\n");
d82a0345cf218f Thomas Gleixner               2022-09-15  1056  			else
d82a0345cf218f Thomas Gleixner               2022-09-15  1057  				pr_err("WARNING: kernel not compiled with CALL_DEPTH_TRACKING.\n");
d82a0345cf218f Thomas Gleixner               2022-09-15  1058  
d82a0345cf218f Thomas Gleixner               2022-09-15  1059  			goto do_cmd_auto;
d82a0345cf218f Thomas Gleixner               2022-09-15  1060  		}
d82a0345cf218f Thomas Gleixner               2022-09-15  1061  		break;
d82a0345cf218f Thomas Gleixner               2022-09-15  1062  
f43b9876e857c7 Peter Zijlstra                2022-06-27  1063  do_cmd_auto:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1064  	case RETBLEED_CMD_AUTO:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1065  	default:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1066  		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
f43b9876e857c7 Peter Zijlstra                2022-06-27  1067  		    boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
953a4955188e0e Peter Zijlstra                2023-08-07  1068  			if (IS_ENABLED(CONFIG_CPU_UNRET_ENTRY)) {
953a4955188e0e Peter Zijlstra                2023-08-07  1069  				if (boot_cpu_has_bug(X86_BUG_RETBLEED))
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1070  					retbleed_mitigation = RETBLEED_MITIGATION_UNRET;
953a4955188e0e Peter Zijlstra                2023-08-07  1071  
953a4955188e0e Peter Zijlstra                2023-08-07  1072  				if (boot_cpu_has_bug(X86_BUG_SRSO) && !boot_cpu_has(X86_FEATURE_SRSO_NO)) {
953a4955188e0e Peter Zijlstra                2023-08-07  1073  					if (boot_cpu_data.x86 == 0x19)
953a4955188e0e Peter Zijlstra                2023-08-07  1074  						retbleed_mitigation = RETBLEED_MITIGATION_UNRET_SRSO_ALIAS;
953a4955188e0e Peter Zijlstra                2023-08-07  1075  					else
953a4955188e0e Peter Zijlstra                2023-08-07  1076  						retbleed_mitigation = RETBLEED_MITIGATION_UNRET_SRSO;
953a4955188e0e Peter Zijlstra                2023-08-07  1077  				}
953a4955188e0e Peter Zijlstra                2023-08-07  1078  			}
b5d4262fb3d781 Peter Zijlstra                2023-08-07  1079  			else if (boot_cpu_has(X86_FEATURE_IBPB))
f43b9876e857c7 Peter Zijlstra                2022-06-27  1080  				retbleed_mitigation = RETBLEED_MITIGATION_IBPB;
f43b9876e857c7 Peter Zijlstra                2022-06-27  1081  		}
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1082  
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1083  		/*
0fe4aeea9c01ba Josh Poimboeuf                2022-06-14  1084  		 * The Intel mitigation (IBRS or eIBRS) was already selected in
0fe4aeea9c01ba Josh Poimboeuf                2022-06-14  1085  		 * spectre_v2_select_mitigation().  'retbleed_mitigation' will
0fe4aeea9c01ba Josh Poimboeuf                2022-06-14  1086  		 * be set accordingly below.
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1087  		 */
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1088  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1089  		break;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1090  	}
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1091  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1092  	switch (retbleed_mitigation) {
953a4955188e0e Peter Zijlstra                2023-08-07  1093  	case RETBLEED_MITIGATION_UNRET_SRSO_ALIAS:
953a4955188e0e Peter Zijlstra                2023-08-07  1094  		setup_force_cpu_cap(X86_FEATURE_SRSO_ALIAS);
953a4955188e0e Peter Zijlstra                2023-08-07  1095  		x86_return_thunk = srso_alias_return_thunk;
953a4955188e0e Peter Zijlstra                2023-08-07 @1096  		goto do_rethunk;
953a4955188e0e Peter Zijlstra                2023-08-07  1097  
953a4955188e0e Peter Zijlstra                2023-08-07  1098  	case RETBLEED_MITIGATION_UNRET_SRSO:
953a4955188e0e Peter Zijlstra                2023-08-07  1099  		setup_force_cpu_cap(X86_FEATURE_SRSO);
953a4955188e0e Peter Zijlstra                2023-08-07  1100  		x86_return_thunk = srso_return_thunk;
953a4955188e0e Peter Zijlstra                2023-08-07  1101  		goto do_rethunk;
953a4955188e0e Peter Zijlstra                2023-08-07  1102  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1103  	case RETBLEED_MITIGATION_UNRET:
5ea91c46f6a187 Peter Zijlstra                2023-08-07  1104  		x86_return_thunk = retbleed_return_thunk;
953a4955188e0e Peter Zijlstra                2023-08-07  1105  do_rethunk:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1106  		setup_force_cpu_cap(X86_FEATURE_UNRET);
953a4955188e0e Peter Zijlstra                2023-08-07  1107  		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1108  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1109  		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1110  		    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1111  			pr_err(RETBLEED_UNTRAIN_MSG);
3ebc170068885b Peter Zijlstra                2022-06-14  1112  
3ebc170068885b Peter Zijlstra                2022-06-14  1113  		mitigate_smt = true;
3ebc170068885b Peter Zijlstra                2022-06-14  1114  		break;
3ebc170068885b Peter Zijlstra                2022-06-14  1115  
3ebc170068885b Peter Zijlstra                2022-06-14  1116  	case RETBLEED_MITIGATION_IBPB:
3ebc170068885b Peter Zijlstra                2022-06-14  1117  		setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1118  		setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1119  		mitigate_smt = true;
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1120  		break;
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1121  
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1122  	case RETBLEED_MITIGATION_IBPB_VMEXIT:
4127d49e25c7e1 Peter Zijlstra                2023-08-07  1123  		setup_force_cpu_cap(X86_FEATURE_IBPB_ON_VMEXIT);
3ebc170068885b Peter Zijlstra                2022-06-14  1124  		mitigate_smt = true;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1125  		break;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1126  
d82a0345cf218f Thomas Gleixner               2022-09-15  1127  	case RETBLEED_MITIGATION_STUFF:
d82a0345cf218f Thomas Gleixner               2022-09-15  1128  		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
d82a0345cf218f Thomas Gleixner               2022-09-15  1129  		setup_force_cpu_cap(X86_FEATURE_CALL_DEPTH);
d82a0345cf218f Thomas Gleixner               2022-09-15  1130  		x86_set_skl_return_thunk();
d82a0345cf218f Thomas Gleixner               2022-09-15  1131  		break;
d82a0345cf218f Thomas Gleixner               2022-09-15  1132  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1133  	default:
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1134  		break;
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1135  	}
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1136  
3ebc170068885b Peter Zijlstra                2022-06-14  1137  	if (mitigate_smt && !boot_cpu_has(X86_FEATURE_STIBP) &&
3ebc170068885b Peter Zijlstra                2022-06-14  1138  	    (retbleed_nosmt || cpu_mitigations_auto_nosmt()))
3ebc170068885b Peter Zijlstra                2022-06-14  1139  		cpu_smt_disable(false);
3ebc170068885b Peter Zijlstra                2022-06-14  1140  
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1141  	/*
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1142  	 * Let IBRS trump all on Intel without affecting the effects of the
d82a0345cf218f Thomas Gleixner               2022-09-15  1143  	 * retbleed= cmdline option except for call depth based stuffing
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1144  	 */
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1145  	if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1146  		switch (spectre_v2_enabled) {
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1147  		case SPECTRE_V2_IBRS:
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1148  			retbleed_mitigation = RETBLEED_MITIGATION_IBRS;
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1149  			break;
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1150  		case SPECTRE_V2_EIBRS:
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1151  		case SPECTRE_V2_EIBRS_RETPOLINE:
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1152  		case SPECTRE_V2_EIBRS_LFENCE:
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1153  			retbleed_mitigation = RETBLEED_MITIGATION_EIBRS;
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1154  			break;
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1155  		default:
d82a0345cf218f Thomas Gleixner               2022-09-15  1156  			if (retbleed_mitigation != RETBLEED_MITIGATION_STUFF)
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1157  				pr_err(RETBLEED_INTEL_MSG);
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1158  		}
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1159  	}
6ad0ad2bf8a67e Peter Zijlstra                2022-06-24  1160  
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1161  	pr_info("%s\n", retbleed_strings[retbleed_mitigation]);
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1162  }
7fbf47c7ce50b3 Alexandre Chartre             2022-06-14  1163  

:::::: The code at line 1096 was first introduced by commit
:::::: 953a4955188e0ec86ce13daf1e5d4fbbba2db8fc x86/cpu: Add SRSO untrain to retbleed=

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
