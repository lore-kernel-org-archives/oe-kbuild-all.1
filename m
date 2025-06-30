Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36B23AB8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274873; cv=none; b=pHsJXiek/J4G8+90z962sde99XzPXmnu/O/gASO+AyKfWx0TVHFR9Z0KCTgVx2ocDdLv9+gTpqq9+aGRWepREM3ADkhnSIdcC+WfI1OGeJWBGn+DNSVRBQItzh03wy0HqpluGFNV7CALPChFSI+pe0F6oN5G432sDiDciSN9NfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274873; c=relaxed/simple;
	bh=+ciEc3geEqxA7USk4wBQIdNIAHo910IlmLxKHaMgxjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TEpQhxRo0iaLN1gYin5L3k/RDjQHGjdF6iOGdssStxhO0Ax4DUSZBtjQX7iStA2vHVX7o648COtNq93zx7XFXY+iG7MQ0q0QyDYu9lli3PZhIP+gkTydXjBLt0+EQaX0Sj2ZUMmYEUj0nn4bf2PWeOeb9Dp0PMcOP+b5K/rtAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuzSvQp1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuzSvQp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751274872; x=1782810872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ciEc3geEqxA7USk4wBQIdNIAHo910IlmLxKHaMgxjE=;
  b=ZuzSvQp15ZlGsmjw4fEpaoRetgwbVb4kOanuotAgaUo/up3jdAZCf/67
   LE+Or97qI1oHeOVb5L2WCnV5B1JftyRwFQ5+VlnZ1gXz+aVO4KB5yRLjS
   TndQKWJy7xRXH0vvpNCjYXKbhca/vv5szf5bfWbVGfrLy1zunjjfBgcpW
   SnHbuRH+bsbK45FYr572spSLrpmV7hhxr9/W/M2b43opJGX7CcSwFmb1M
   p7h5hDpw8fA9UVZ+/lNbfbVmrpsV4vRZzOfXUcOjHsjrhRJba9RWH+G1j
   Lu+EfqIHp+d96kKeG9efiQ/x5OeydObXHfmWhwo9tMQIyVKpY494YzLPk
   w==;
X-CSE-ConnectionGUID: AW+t5r94TTaMUmK0RyTzrA==
X-CSE-MsgGUID: ZusjQILOQvqCNHC6QNKMXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64189242"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64189242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:14:31 -0700
X-CSE-ConnectionGUID: 36fq/8NhTJKbLyYqFy3yZA==
X-CSE-MsgGUID: 8nm9WVDFRzOlMMc9rynDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153712660"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jun 2025 02:14:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWAaq-000Yin-1L;
	Mon, 30 Jun 2025 09:14:28 +0000
Date: Mon, 30 Jun 2025 17:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev3 4/6] lib/kunit/kprobe_stub.c:25:12:
 error: conflicting types for 'kprobe_handler'; have 'int(struct kprobe *,
 struct pt_regs *)'
Message-ID: <202506301708.YJgkPz1n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev3
head:   feed99729a7729442ce6bace637033f9bd78a78c
commit: a5d9a2e9789fbe579fcdf56097c87d81e59896c9 [4/6] kunit: Expose 'kprobes stub' API to redirect functions
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250630/202506301708.YJgkPz1n-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301708.YJgkPz1n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301708.YJgkPz1n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/kunit/kprobe_stub.c:25:12: error: conflicting types for 'kprobe_handler'; have 'int(struct kprobe *, struct pt_regs *)'
      25 | static int kprobe_handler(struct kprobe *kp, struct pt_regs *regs)
         |            ^~~~~~~~~~~~~~
   In file included from include/linux/kprobes.h:31,
                    from lib/kunit/kprobe_stub.c:9:
   arch/powerpc/include/asm/kprobes.h:88:12: note: previous declaration of 'kprobe_handler' with type 'int(struct pt_regs *)'
      88 | extern int kprobe_handler(struct pt_regs *regs);
         |            ^~~~~~~~~~~~~~


vim +25 lib/kunit/kprobe_stub.c

    24	
  > 25	static int kprobe_handler(struct kprobe *kp, struct pt_regs *regs)
    26	{
    27		struct kunit_kprobe_stub_ctx *ctx = container_of(kp, struct kunit_kprobe_stub_ctx, kp);
    28	
    29		instruction_pointer_set(regs, ctx->replacement_addr);
    30		return 1;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
