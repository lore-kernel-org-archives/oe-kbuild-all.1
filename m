Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE506AA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676640977; x=1708176977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3oIm8+EOGmv7SNVkzwn0ZvyAcU9VU2KMvRgrvT5zPI=;
  b=W8Uxozr/N0/6jusT7EWtekw6luoHFG2E1ynDKhMGeobRLcy2ncp3LR6S
   BTfy8C1FSAv+7CM3rmJSz2mod3f4PmRvTx1wb/KbKU1GnX2OSktFGsYJ7
   NlSbW5j1e3gZQ8cuaalv4K03/Wzc2cvepF2vQILR2gT418w11HE2A45sU
   4wNDspGtifbMt/NiK4IdjT17+cRGRzbrxvOh6CZI1TeUvb+908FXbPRQf
   /LBU0TbFBR4+5g1wZpTSNeZW3Tbuol4PTzdhHqJT+9HuVE33CIuOhL3ps
   L4WjtoubXxItgu0L+tYzNmfwGHAmgHCu0EaTKLIUakh45k79+LOyq/BOj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396661885"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396661885"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 05:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739265158"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739265158"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 05:36:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT0uM-000BVF-0Y;
	Fri, 17 Feb 2023 13:36:14 +0000
Date: Fri, 17 Feb 2023 21:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Borislav Petkov <bp@suse.de>,
	Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
	Suraj Jitindar Singh <surajjs@amazon.com>,
	Suleiman Souhlal <suleiman@google.com>
Subject: [stable:linux-4.19.y 4340/5220] arch/x86/kvm/vmx.c:10763:1: warning:
 'inline' is not at beginning of declaration
Message-ID: <202302172129.LCWCNLUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: e6ac9561776a1fa80e245993f94c8f63fa15632b [4340/5220] KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230217/202302172129.LCWCNLUT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=e6ac9561776a1fa80e245993f94c8f63fa15632b
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout e6ac9561776a1fa80e245993f94c8f63fa15632b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172129.LCWCNLUT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/vmx.c: In function 'allow_1_setting':
   arch/x86/kvm/vmx.c:4532:13: warning: variable 'vmx_msr_low' set but not used [-Wunused-but-set-variable]
    4532 |         u32 vmx_msr_low, vmx_msr_high;
         |             ^~~~~~~~~~~
   arch/x86/kvm/vmx.c: At top level:
>> arch/x86/kvm/vmx.c:10763:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
   10763 | u64 __always_inline vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx)
         | ^~~
   arch/x86/kvm/vmx.c: In function 'vmx_set_msr':
   arch/x86/kvm/vmx.c:4359:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4359 |                 if ((data >> 32) != 0)
         |                    ^
   arch/x86/kvm/vmx.c:4362:9: note: here
    4362 |         default:
         |         ^~~~~~~
   arch/x86/kvm/vmx.c: In function 'vmx_get_msr':
   arch/x86/kvm/vmx.c:4174:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4174 |                 if (!msr_info->host_initiated &&
         |                    ^
   arch/x86/kvm/vmx.c:4178:9: note: here
    4178 |         default:
         |         ^~~~~~~


vim +/inline +10763 arch/x86/kvm/vmx.c

 10762	
 10763	u64 __always_inline vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx)
 10764	{
 10765		u64 guestval, hostval = this_cpu_read(x86_spec_ctrl_current);
 10766	
 10767		if (!cpu_feature_enabled(X86_FEATURE_MSR_SPEC_CTRL))
 10768			return 0;
 10769	
 10770		guestval = __rdmsr(MSR_IA32_SPEC_CTRL);
 10771	
 10772		/*
 10773		 * If the guest/host SPEC_CTRL values differ, restore the host value.
 10774		 */
 10775		if (guestval != hostval)
 10776			native_wrmsrl(MSR_IA32_SPEC_CTRL, hostval);
 10777	
 10778		barrier_nospec();
 10779	
 10780		return guestval;
 10781	}
 10782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
