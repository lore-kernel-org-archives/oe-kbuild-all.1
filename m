Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828B37C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678935260; x=1710471260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jO7ZKF0SMRgP44pxK/XBR8FWmntt3r6YB0sYJx3ToFY=;
  b=GOpQv9FcP688+lC/5QOBOKj0DcyZlllLhLeknwj2RNA2AOH5lYij+eX8
   TTqYVrGdIN0v0mBuyquQP5Dctc+uRAN12OqNwcUhHZN/xse7e2ZTtwcM6
   H4UbkR5F2hQ12GmTEwB8ioh6DWKRE/iyRHP6DHI91jaRnj1wpt3Yor8XO
   GCZ5uTCQHHYnzFkM9MAt/AuIZPx2k1HFHRBPTymOO4fnJiF5GjdznvW2A
   NZcA72dUpJxpFjN2/El/XOvRpuVtSPWSPgVKXQaUvIz9/ZH9Ux66v4Jd5
   enswbARehXinbut2zo34/iBk88gljtaFew/ksJiXHDmv8W4JhNi8MByMW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336565859"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="336565859"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790092130"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="790092130"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2023 19:54:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcdkw-0008GV-0u;
	Thu, 16 Mar 2023 02:54:18 +0000
Date: Thu, 16 Mar 2023 10:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9399/9999] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x4c: unreachable instruction
Message-ID: <202303161032.qYNd8hr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   2ddbd0f967b34872290e0f98fae32b91b4de7b87
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [9399/9999] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-a001-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161032.qYNd8hr5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=54aa76ad5f0148ad54fc7ad42ad5a079bc12efee
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161032.qYNd8hr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x4c: unreachable instruction


objdump-func vmlinux.o sysvec_reboot:
0000 0000000000002900 <sysvec_reboot>:
0000     2900:	55                   	push   %rbp
0001     2901:	48 89 e5             	mov    %rsp,%rbp
0004     2904:	41 55                	push   %r13
0006     2906:	41 54                	push   %r12
0008     2908:	49 89 fc             	mov    %rdi,%r12
000b     290b:	e8 00 00 00 00       	call   2910 <sysvec_reboot+0x10>	290c: R_X86_64_PLT32	irqentry_enter-0x4
0010     2910:	41 f6 84 24 88 00 00 00 03 	testb  $0x3,0x88(%r12)
0019     2919:	75 51                	jne    296c <sysvec_reboot+0x6c>
001b     291b:	41 89 c5             	mov    %eax,%r13d
001e     291e:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 2925 <sysvec_reboot+0x25>	2921: R_X86_64_PC32	hardirq_stack_inuse-0x4
0025     2925:	84 c0                	test   %al,%al
0027     2927:	75 43                	jne    296c <sysvec_reboot+0x6c>
0029     2929:	65 c6 05 00 00 00 00 01 	movb   $0x1,%gs:0x0(%rip)        # 2931 <sysvec_reboot+0x31>	292c: R_X86_64_PC32	hardirq_stack_inuse-0x5
0031     2931:	65 4c 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%r11        # 2939 <sysvec_reboot+0x39>	2935: R_X86_64_PC32	hardirq_stack_ptr-0x4
0039     2939:	49 89 23             	mov    %rsp,(%r11)
003c     293c:	4c 89 dc             	mov    %r11,%rsp
003f     293f:	e8 00 00 00 00       	call   2944 <sysvec_reboot+0x44>	2940: R_X86_64_PLT32	irq_enter_rcu-0x4
0044     2944:	4c 89 e7             	mov    %r12,%rdi
0047     2947:	e8 00 00 00 00       	call   294c <sysvec_reboot+0x4c>	2948: R_X86_64_PC32	.text+0xbd27c
004c     294c:	e8 00 00 00 00       	call   2951 <sysvec_reboot+0x51>	294d: R_X86_64_PLT32	irq_exit_rcu-0x4
0051     2951:	5c                   	pop    %rsp
0052     2952:	44 89 ee             	mov    %r13d,%esi
0055     2955:	4c 89 e7             	mov    %r12,%rdi
0058     2958:	65 c6 05 00 00 00 00 00 	movb   $0x0,%gs:0x0(%rip)        # 2960 <sysvec_reboot+0x60>	295b: R_X86_64_PC32	hardirq_stack_inuse-0x5
0060     2960:	e8 00 00 00 00       	call   2965 <sysvec_reboot+0x65>	2961: R_X86_64_PLT32	irqentry_exit-0x4
0065     2965:	41 5c                	pop    %r12
0067     2967:	41 5d                	pop    %r13
0069     2969:	5d                   	pop    %rbp
006a     296a:	c3                   	ret
006b     296b:	cc                   	int3
006c     296c:	e8 00 00 00 00       	call   2971 <sysvec_reboot+0x71>	296d: R_X86_64_PLT32	irq_enter_rcu-0x4
0071     2971:	4c 89 e7             	mov    %r12,%rdi
0074     2974:	e8 00 00 00 00       	call   2979 <sysvec_reboot+0x79>	2975: R_X86_64_PC32	.text+0xbd27c
0079     2979:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
