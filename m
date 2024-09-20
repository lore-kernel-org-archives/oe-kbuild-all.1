Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F4502B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 22:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726872500; cv=none; b=rA2mkWiqfb5/D8GWyWY//BQrJo8RH37g9oqNYaDoT6UPYWln6Ozgsy3FTShI7VP3YzYw+hq4SgOajjW3U3RehluCS9Hnmqfu/FobVDNddDEho1MD9b1SNpHs4W5vouBhK2CcfoKL2Qq31p+Yv6U5r31vuilcS+8l7gMRaM2tLPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726872500; c=relaxed/simple;
	bh=hdmouBA2Fkx5bePjcBX+6GnwNambaYOZzqM9ICWCgk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to6riasME/JvRT2qL7ptAfdhdwZbOVlDIU4bISy64yfqh84A52Fw9TRPm1M5z9Zla1+LfGrzCKqfsD7e9/8Vi4Mtp+AkdUb4I0Ciq8PcsrQNBFBeXaodggaPKUt2Zl2lGjyC88Beau9g0xCe7+z5GLnFFMjOP4CrPwO/Xt/rQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpsfZywA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpsfZywA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726872498; x=1758408498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hdmouBA2Fkx5bePjcBX+6GnwNambaYOZzqM9ICWCgk0=;
  b=ZpsfZywAXufnXu75rIJnk8aKTDF4wL08SHp/0kzxoccw177/hgQzMbPz
   SNIw4Y0OqxLuq8urL3x07ipY0AtT/sE6mit5ngD22kKZLqjv2z69AlfVo
   Uk1MrK8DPxtrWczp82Xs4C+2lK7W1nzGpAGL0pfYI+KKgWX3dC4st9kei
   oBbRV3AQiMWlvjOp8+zRGjOC2+K3EHzI2CZFzCsu9OOJ5o3gQw6YDn5fM
   s2lz3a4+rTFEcnfDj5pH6R3MOprSxyx0QFg9aphXNmwDDIRJKIdLYnyJt
   qiKzpSjTyK2omxjxdl2Jby/7rwdeI7b6+mRiGiyN+VY2it7sBBQ4accgL
   g==;
X-CSE-ConnectionGUID: KzOfpUlkS42rxNii1HWAHw==
X-CSE-MsgGUID: 5itmqcF4RCeFN1d81ntevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="13616473"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="13616473"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 15:48:18 -0700
X-CSE-ConnectionGUID: qasY6n63QBe3Sm1c8KOMDg==
X-CSE-MsgGUID: /7e4d6ORRjuY9159fwd43A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="101178881"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Sep 2024 15:48:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srmQA-000EuZ-17;
	Fri, 20 Sep 2024 22:48:14 +0000
Date: Sat, 21 Sep 2024 06:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 381/30000]
 drivers/firmware/arm_scmi/driver.o: warning: objtool:
 scmi_devm_protocol_match()+0x6d: unreachable instruction
Message-ID: <202409210610.8kkt8E6x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cristian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7b9f6a0ecd235bca2b4329476f817a6182ea8d8a
commit: bfacf9cff579b764d5148218d4f99d98fb2827b0 [381/30000] FROMLIST: firmware: arm_scmi: introduce devres get/put protocols operations
config: x86_64-buildonly-randconfig-002-20240912 (https://download.01.org/0day-ci/archive/20240921/202409210610.8kkt8E6x-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210610.8kkt8E6x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210610.8kkt8E6x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/driver.o: warning: objtool: scmi_devm_protocol_match()+0x6d: unreachable instruction


objdump-func vmlinux.o scmi_devm_protocol_match:
0000 00000000029aefe2 <scmi_devm_protocol_match>:
0000  29aefe2:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	29aefe3: R_X86_64_NONE	__fentry__-0x4
0005  29aefe7:	55                   	push   %rbp
0006  29aefe8:	48 89 e5             	mov    %rsp,%rbp
0009  29aefeb:	41 57                	push   %r15
000b  29aefed:	41 56                	push   %r14
000d  29aefef:	53                   	push   %rbx
000e  29aeff0:	48 89 d3             	mov    %rdx,%rbx
0011  29aeff3:	49 89 f6             	mov    %rsi,%r14
0014  29aeff6:	e8 00 00 00 00       	call   29aeffb <scmi_devm_protocol_match+0x19>	29aeff7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0019  29aeffb:	4d 85 f6             	test   %r14,%r14
001c  29aeffe:	74 48                	je     29af048 <scmi_devm_protocol_match+0x66>
001e  29af000:	48 85 db             	test   %rbx,%rbx
0021  29af003:	74 43                	je     29af048 <scmi_devm_protocol_match+0x66>
0023  29af005:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
002d  29af00f:	e8 00 00 00 00       	call   29af014 <scmi_devm_protocol_match+0x32>	29af010: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0032  29af014:	49 83 c6 08          	add    $0x8,%r14
0036  29af018:	4c 89 f0             	mov    %r14,%rax
0039  29af01b:	48 c1 e8 03          	shr    $0x3,%rax
003d  29af01f:	42 8a 04 38          	mov    (%rax,%r15,1),%al
0041  29af023:	84 c0                	test   %al,%al
0043  29af025:	75 2c                	jne    29af053 <scmi_devm_protocol_match+0x71>
0045  29af027:	48 89 d8             	mov    %rbx,%rax
0048  29af02a:	45 8a 36             	mov    (%r14),%r14b
004b  29af02d:	48 c1 e8 03          	shr    $0x3,%rax
004f  29af031:	42 8a 04 38          	mov    (%rax,%r15,1),%al
0053  29af035:	84 c0                	test   %al,%al
0055  29af037:	75 2e                	jne    29af067 <scmi_devm_protocol_match+0x85>
0057  29af039:	31 c0                	xor    %eax,%eax
0059  29af03b:	44 3a 33             	cmp    (%rbx),%r14b
005c  29af03e:	0f 94 c0             	sete   %al
005f  29af041:	5b                   	pop    %rbx
0060  29af042:	41 5e                	pop    %r14
0062  29af044:	41 5f                	pop    %r15
0064  29af046:	5d                   	pop    %rbp
0065  29af047:	c3                   	ret
0066  29af048:	e8 00 00 00 00       	call   29af04d <scmi_devm_protocol_match+0x6b>	29af049: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006b  29af04d:	0f 0b                	ud2
006d  29af04f:	31 c0                	xor    %eax,%eax
006f  29af051:	eb ee                	jmp    29af041 <scmi_devm_protocol_match+0x5f>
0071  29af053:	44 89 f1             	mov    %r14d,%ecx
0074  29af056:	80 e1 07             	and    $0x7,%cl
0077  29af059:	38 c1                	cmp    %al,%cl
0079  29af05b:	7c ca                	jl     29af027 <scmi_devm_protocol_match+0x45>
007b  29af05d:	4c 89 f7             	mov    %r14,%rdi
007e  29af060:	e8 00 00 00 00       	call   29af065 <scmi_devm_protocol_match+0x83>	29af061: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0083  29af065:	eb c0                	jmp    29af027 <scmi_devm_protocol_match+0x45>
0085  29af067:	89 d9                	mov    %ebx,%ecx
0087  29af069:	80 e1 07             	and    $0x7,%cl
008a  29af06c:	38 c1                	cmp    %al,%cl
008c  29af06e:	7c c9                	jl     29af039 <scmi_devm_protocol_match+0x57>
008e  29af070:	48 89 df             	mov    %rbx,%rdi
0091  29af073:	e8 00 00 00 00       	call   29af078 <scmi_devm_protocol_match+0x96>	29af074: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0096  29af078:	eb bf                	jmp    29af039 <scmi_devm_protocol_match+0x57>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
