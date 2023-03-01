Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915F2F3E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677710020; x=1709246020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ESLGuxvw2TUAGX6MpsdKUIzw57ZSyYyXd3IodTsMs+U=;
  b=CFqoO4fXb0+VhKRtVQPVPcehT8yDD0BGX8cQm5Q39Q0BMBU/FudWq5bJ
   LBXiipTaHiTodvfE6DN/Dmrbf4RpPLabv6/HbACiZijhOFrq2Ff7Z1WYZ
   9Qqyztqe3i4iOs5mXtXzhIkG6Y/Z7xn9waC9mAY39CHqo0GsGvUhcTsBA
   7S0earVGk5zpazIc8YO3Z+YIMf+k0G19zYPzPSf1JMba1E1B54dEcKLyJ
   DW2BP8t/CYCNon6ggvHjKWI+tve9dVZqYKsIMVm9n9DAVtksosxNFRBgJ
   NLM+wtZpWElzkEalbwaa05j05gDDgrQpJ5YGSjdq8pNxX6df5m+fpexxo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332019097"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="332019097"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 14:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798582867"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="798582867"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Mar 2023 14:33:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXV0y-0006T9-2l;
	Wed, 01 Mar 2023 22:33:36 +0000
Date: Thu, 2 Mar 2023 06:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-prefix-orc 5/6] vmlinux.o: warning: objtool:
 __UNIQUE_ID_nop320+0x0: failed to create pfx symbol
Message-ID: <202303020655.kRdtZiHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-prefix-orc
head:   2b59c194afe7491e0a86fda4188c65d9322a5837
commit: 025e0ae3bb536c53a13df7ff4c3751029e4b7cd7 [5/6] objtool: Separate prefix code from stack validation code
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230302/202303020655.kRdtZiHF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=025e0ae3bb536c53a13df7ff4c3751029e4b7cd7
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-prefix-orc
        git checkout 025e0ae3bb536c53a13df7ff4c3751029e4b7cd7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020655.kRdtZiHF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: seto+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setno+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setc+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnc+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setz+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnz+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setbe+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnbe+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sets+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setns+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setp+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnp+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setle+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: setnle+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: salc+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: addb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: addw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: addl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: addq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: orb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: orw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: orl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: orq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: adcb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: adcw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: adcl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: adcq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sbbb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sbbw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sbbl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sbbq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: andb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: andw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: andl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: andq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: subb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: subw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: subl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: subq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xorb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xorw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xorl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xorq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: testb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: testw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: testl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: testq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: mul_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: mul_cx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: mul_ecx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: mul_rcx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imul_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imul_cx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imul_ecx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imul_rcx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: div_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: div_cx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: div_ecx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: div_rcx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: idiv_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: idiv_cx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: idiv_ecx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: idiv_rcx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop320+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shldw_ax_dx_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shldl_eax_edx_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shldq_rax_rdx_cl+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop321+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrdw_ax_dx_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrdl_eax_edx_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrdq_rax_rdx_cl+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop322+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imulw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imull_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: imulq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: notb_al+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: notw_ax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: notl_eax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: notq_rax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: negb_al+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: negw_ax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: negl_eax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: negq_rax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: incb_al+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: incw_ax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: incl_eax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: incq_rax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: decb_al+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: decw_ax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: decl_eax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: decq_rax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rolb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rolw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: roll_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rolq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rorb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rorw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rorl_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rorq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rclb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rclw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rcll_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rclq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rcrb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rcrw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rcrl_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: rcrq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shlb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shlw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shll_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shlq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrl_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: shrq_rax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sarb_al_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sarw_ax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sarl_eax_cl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sarq_rax_cl+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop323+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsfw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsfl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsfq_rax_rdx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop324+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsrw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsrl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: bsrq_rax_rdx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop325+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btq_rax_rdx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop326+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btsw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btsl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btsq_rax_rdx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop327+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btrw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btrl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btrq_rax_rdx+0x0: failed to create pfx symbol
>> vmlinux.o: warning: objtool: __UNIQUE_ID_nop328+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btcw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btcl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: btcq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xaddb_al_dl+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xaddw_ax_dx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xaddl_eax_edx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: xaddq_rax_rdx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpb_dl_al+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpw_dx_ax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpl_edx_eax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: cmpq_rdx_rax+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: ftrace_stub+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: ftrace_stub_graph+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: arch_rethook_trampoline+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha1_transform_ssse3+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha1_transform_avx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha1_ni_transform+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha256_transform_ssse3+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha256_transform_avx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha256_transform_rorx+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sha256_ni_transform+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sm4_aesni_avx_ctr_enc_blk8+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sm4_aesni_avx_cbc_dec_blk8+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: sm4_aesni_avx_cfb_dec_blk8+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: int3_magic+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: __memcpy+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: __memcpy+0x0: failed to create pfx symbol
   vmlinux.o: warning: objtool: zen_untrain_ret+0x0: failed to create pfx symbol


objdump-func vmlinux.o __UNIQUE_ID_nop320:
0000 00000000000b58c0 <__UNIQUE_ID_nop320>:
0000    b58c0:	f3 0f 1e fa          	endbr64
0004    b58c4:	e9 00 00 00 00       	jmp    b58c9 <__UNIQUE_ID_nop320+0x9>	b58c5: R_X86_64_PLT32	__x86_return_thunk-0x4
0009    b58c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
