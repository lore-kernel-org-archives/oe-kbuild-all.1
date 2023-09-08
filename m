Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047DF30F9C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694213679; x=1725749679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eUm4yl2BAMHBo03g5Rb/N9p2aZICoAAK9LpFQ7u8z4s=;
  b=GjNV3aJuGKgiC+nIKM8pKXDs9PhHTrtcq8NlQSFdKRaW3PxN4h04tA0F
   nMQWr/QOuSzb4egmH2jMwezqe7QqFNlVRhohg2J3icYZywntNs6UYaKvb
   K/xOz0P93gUV730Y/pRN3YWjexMRCRGXs8dMp/BrwMpe123TEKX6TBLZh
   zqDXDFN+CUaQcS/wdBC8GPFChDG8TKjXg8fX29wB69XBv1Z2I3HpLvi6f
   yvfVXz75tL4s9Q8eTP8zTrTTlS7QT/Ljf8jEb9G0l4k0jI9jMFNrIC5Ga
   cTEjB6htSYCKMfsgOAPNz5HDYhu1qugt+0cDU6yPzZgo9mrQrAV2NYXPO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="358066921"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="358066921"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 15:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742667451"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="742667451"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 15:54:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekMy-0002hP-0h;
	Fri, 08 Sep 2023 22:54:32 +0000
Date: Sat, 9 Sep 2023 06:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alfred Piccioni <alpic@google.com>, Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>
Cc: oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org,
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alfred Piccioni <alpic@google.com>
Subject: Re: [PATCH V2] SELinux: Check correct permissions for FS_IOC32_*
Message-ID: <202309090600.NSyo7d2q-lkp@intel.com>
References: <20230906115928.3749928-1-alpic@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906115928.3749928-1-alpic@google.com>

Hi Alfred,

kernel test robot noticed the following build errors:

[auto build test ERROR on 50a510a78287c15cee644f345ef8bac8977986a7]

url:    https://github.com/intel-lab-lkp/linux/commits/Alfred-Piccioni/SELinux-Check-correct-permissions-for-FS_IOC32_/20230906-200131
base:   50a510a78287c15cee644f345ef8bac8977986a7
patch link:    https://lore.kernel.org/r/20230906115928.3749928-1-alpic%40google.com
patch subject: [PATCH V2] SELinux: Check correct permissions for FS_IOC32_*
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230909/202309090600.NSyo7d2q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090600.NSyo7d2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090600.NSyo7d2q-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/selinux/hooks.c: In function 'selinux_file_ioctl':
>> security/selinux/hooks.c:3647:9: error: duplicate case value
    3647 |         case FS_IOC32_GETFLAGS:
         |         ^~~~
   security/selinux/hooks.c:3645:9: note: previously used here
    3645 |         case FS_IOC_GETFLAGS:
         |         ^~~~
   security/selinux/hooks.c:3648:9: error: duplicate case value
    3648 |         case FS_IOC32_GETVERSION:
         |         ^~~~
   security/selinux/hooks.c:3646:9: note: previously used here
    3646 |         case FS_IOC_GETVERSION:
         |         ^~~~
   security/selinux/hooks.c:3654:9: error: duplicate case value
    3654 |         case FS_IOC32_SETFLAGS:
         |         ^~~~
   security/selinux/hooks.c:3652:9: note: previously used here
    3652 |         case FS_IOC_SETFLAGS:
         |         ^~~~
   security/selinux/hooks.c:3655:9: error: duplicate case value
    3655 |         case FS_IOC32_SETVERSION:
         |         ^~~~
   security/selinux/hooks.c:3653:9: note: previously used here
    3653 |         case FS_IOC_SETVERSION:
         |         ^~~~


vim +3647 security/selinux/hooks.c

  3634	
  3635	static int selinux_file_ioctl(struct file *file, unsigned int cmd,
  3636				      unsigned long arg)
  3637	{
  3638		const struct cred *cred = current_cred();
  3639		int error = 0;
  3640	
  3641		switch (cmd) {
  3642		case FIONREAD:
  3643		case FIBMAP:
  3644		case FIGETBSZ:
  3645		case FS_IOC_GETFLAGS:
  3646		case FS_IOC_GETVERSION:
> 3647		case FS_IOC32_GETFLAGS:
  3648		case FS_IOC32_GETVERSION:
  3649			error = file_has_perm(cred, file, FILE__GETATTR);
  3650			break;
  3651	
  3652		case FS_IOC_SETFLAGS:
  3653		case FS_IOC_SETVERSION:
  3654		case FS_IOC32_SETFLAGS:
  3655		case FS_IOC32_SETVERSION:
  3656			error = file_has_perm(cred, file, FILE__SETATTR);
  3657			break;
  3658	
  3659		/* sys_ioctl() checks */
  3660		case FIONBIO:
  3661		case FIOASYNC:
  3662			error = file_has_perm(cred, file, 0);
  3663			break;
  3664	
  3665		case KDSKBENT:
  3666		case KDSKBSENT:
  3667			error = cred_has_capability(cred, CAP_SYS_TTY_CONFIG,
  3668						    CAP_OPT_NONE, true);
  3669			break;
  3670	
  3671		case FIOCLEX:
  3672		case FIONCLEX:
  3673			if (!selinux_policycap_ioctl_skip_cloexec())
  3674				error = ioctl_has_perm(cred, file, FILE__IOCTL, (u16) cmd);
  3675			break;
  3676	
  3677		/* default case assumes that the command will go
  3678		 * to the file's ioctl() function.
  3679		 */
  3680		default:
  3681			error = ioctl_has_perm(cred, file, FILE__IOCTL, (u16) cmd);
  3682		}
  3683		return error;
  3684	}
  3685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
