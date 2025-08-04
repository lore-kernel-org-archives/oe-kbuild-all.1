Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A2A2E36ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 23:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754350370; cv=none; b=hTF9Qr3Zjri+SzFM39Or7s/Nf5SkmGRmriwpDV8tvmcqN+JdA+aJcUNOnICTTOLyWIc6q8Ip5siwC566RjBzN/LOuOYnPLUWcy/KWlf9gb3yGMloQb2ihppgrMrqlD5WET8TA2il9Z9LwJzhHYLf1suNGCDLS+0BhrBDXJE47Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754350370; c=relaxed/simple;
	bh=Hyd+XveZJk1B3bxZkXEelQOTjkDtX6khLfMjBIpbFKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGygCOUcQBsZaLzOJu9D6SPUoMxThUjTaKhr/StpjRUfXHQMTySEqvPOgjAZ+lWWRCMQa/WOB/RoG+WifiCi0qDqSQTtjAh2B/aURrfYc1smPUzwc7oaMk7BC9IfxpOEerQH3rpGo4G10HM7vmqQ/JApH3KL3OaOBnPKIy9cyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/Qx6std; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Qx6std"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754350368; x=1785886368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hyd+XveZJk1B3bxZkXEelQOTjkDtX6khLfMjBIpbFKU=;
  b=c/Qx6stdpnFwNW2xtSsMQk6P74kcec1hE76mq0Hk/Yv+3grNW/mmUwnz
   tDyjJSR0dONRmjQ/K+0c8q2u81WJK+5HFhmqZX3OYPD3fnvm0Bl4+m/DT
   37L4pYSz01RMe7QqF3YJNvn75aNEWSFs73Je86QbPS/chXlpmKqyJgAut
   gmZlkWHPw4CaeB16PzUjeCZ+IAIy+JbihzDq5HSIlMPLhV0J8pGs7js5h
   BCpdynTKPYz7pxJs5fbZIuYn+JKI2WrwVMM6e1ufAMSKWXRH1laacAZXw
   j+yRlaLDagXSCjug4g1cYXzWnFixdiDGcIRUGb/tIEaM5QawxOv+gDqxl
   A==;
X-CSE-ConnectionGUID: QCxy4g5QT1W9qAQl7+PuLg==
X-CSE-MsgGUID: QAnjiiP5QGi33OngbpUegQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68000013"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="68000013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 16:32:47 -0700
X-CSE-ConnectionGUID: 8Ox5kt3lTTipa3dHDbIioA==
X-CSE-MsgGUID: bwdaquh2Q96d9ZnCPRPt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163544550"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2025 16:32:46 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj4fc-0001sN-0B;
	Mon, 04 Aug 2025 23:32:44 +0000
Date: Tue, 5 Aug 2025 01:32:22 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 net/wireless/wext-proc.c:122:36: warning: unused variable 'wireless_seq_ops'
Message-ID: <202508050100.fVde5HlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   b748b1c7faf801b381d81cd1dc5b258055e37a00
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [1/1] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: x86_64-buildonly-randconfig-2002-20250805 (https://download.01.org/0day-ci/archive/20250805/202508050100.fVde5HlI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050100.fVde5HlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050100.fVde5HlI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:11:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:147:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     147 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^
   include/linux/signal.h:133:2: note: expanded from macro '_SIG_SET_BINOP'
     133 |         case 2:                                                         \
         |         ^
   include/linux/signal.h:147:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
   include/linux/signal.h:137:2: note: expanded from macro '_SIG_SET_BINOP'
     137 |         case 1:                                                         \
         |         ^
   include/linux/signal.h:150:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     150 | _SIG_SET_BINOP(sigandsets, _sig_and)
         | ^
   include/linux/signal.h:133:2: note: expanded from macro '_SIG_SET_BINOP'
     133 |         case 2:                                                         \
         |         ^
   include/linux/signal.h:150:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
   include/linux/signal.h:137:2: note: expanded from macro '_SIG_SET_BINOP'
     137 |         case 1:                                                         \
         |         ^
   include/linux/signal.h:153:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     153 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^
   include/linux/signal.h:133:2: note: expanded from macro '_SIG_SET_BINOP'
     133 |         case 2:                                                         \
         |         ^
   include/linux/signal.h:153:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
   include/linux/signal.h:137:2: note: expanded from macro '_SIG_SET_BINOP'
     137 |         case 1:                                                         \
         |         ^
   include/linux/signal.h:177:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     177 | _SIG_SET_OP(signotset, _sig_not)
         | ^
   include/linux/signal.h:167:2: note: expanded from macro '_SIG_SET_OP'
     167 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |         ^
   include/linux/signal.h:177:1: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
   include/linux/signal.h:169:2: note: expanded from macro '_SIG_SET_OP'
     169 |         case 1: set->sig[0] = op(set->sig[0]);                          \
         |         ^
   include/linux/signal.h:190:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     190 |         case 1: set->sig[0] = 0;
         |         ^
   include/linux/signal.h:190:2: note: insert '__attribute__((fallthrough));' to silence this warning
     190 |         case 1: set->sig[0] = 0;
         |         ^
         |         __attribute__((fallthrough)); 
   include/linux/signal.h:190:2: note: insert 'break;' to avoid fall-through
     190 |         case 1: set->sig[0] = 0;
         |         ^
         |         break; 
   include/linux/signal.h:203:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     203 |         case 1: set->sig[0] = -1;
         |         ^
   include/linux/signal.h:203:2: note: insert '__attribute__((fallthrough));' to silence this warning
     203 |         case 1: set->sig[0] = -1;
         |         ^
         |         __attribute__((fallthrough)); 
   include/linux/signal.h:203:2: note: insert 'break;' to avoid fall-through
     203 |         case 1: set->sig[0] = -1;
         |         ^
         |         break; 
   include/linux/signal.h:233:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     233 |         case 1: ;
         |         ^
   include/linux/signal.h:233:2: note: insert '__attribute__((fallthrough));' to silence this warning
     233 |         case 1: ;
         |         ^
         |         __attribute__((fallthrough)); 
   include/linux/signal.h:233:2: note: insert 'break;' to avoid fall-through
     233 |         case 1: ;
         |         ^
         |         break; 
   include/linux/signal.h:245:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     245 |         case 1: ;
         |         ^
   include/linux/signal.h:245:2: note: insert '__attribute__((fallthrough));' to silence this warning
     245 |         case 1: ;
         |         ^
         |         __attribute__((fallthrough)); 
   include/linux/signal.h:245:2: note: insert 'break;' to avoid fall-through
     245 |         case 1: ;
         |         ^
         |         break; 
   In file included from net/wireless/wext-proc.c:25:
   include/net/iw_handler.h:489:9: warning: performing pointer subtraction with a null pointer has undefined behavior [-Wnull-pointer-subtraction]
     489 |         return IW_EV_POINT_LEN;
         |                ^~~~~~~~~~~~~~~
   include/uapi/linux/wireless.h:1096:5: note: expanded from macro 'IW_EV_POINT_LEN'
    1096 |                          IW_EV_POINT_OFF)
         |                          ^~~~~~~~~~~~~~~
   include/uapi/linux/wireless.h:1093:75: note: expanded from macro 'IW_EV_POINT_OFF'
    1093 | #define IW_EV_POINT_OFF (((char *) &(((struct iw_point *) NULL)->length)) - \
         |                                                                           ^
    1094 |                           (char *) NULL)
         |                           ~~~~~~~~~~~~~
>> net/wireless/wext-proc.c:122:36: warning: unused variable 'wireless_seq_ops' [-Wunused-const-variable]
     122 | static const struct seq_operations wireless_seq_ops = {
         |                                    ^~~~~~~~~~~~~~~~
   23 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/wireless_seq_ops +122 net/wireless/wext-proc.c

3d23e349d80717 Johannes Berg 2009-09-29  121  
3d23e349d80717 Johannes Berg 2009-09-29 @122  static const struct seq_operations wireless_seq_ops = {
3d23e349d80717 Johannes Berg 2009-09-29  123  	.start = wireless_dev_seq_start,
3d23e349d80717 Johannes Berg 2009-09-29  124  	.next  = wireless_dev_seq_next,
3d23e349d80717 Johannes Berg 2009-09-29  125  	.stop  = wireless_dev_seq_stop,
3d23e349d80717 Johannes Berg 2009-09-29  126  	.show  = wireless_dev_seq_show,
3d23e349d80717 Johannes Berg 2009-09-29  127  };
3d23e349d80717 Johannes Berg 2009-09-29  128  

:::::: The code at line 122 was first introduced by commit
:::::: 3d23e349d807177eaf519d444677cee86b1a04cf wext: refactor

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
