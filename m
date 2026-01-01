Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F61229B12
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 00:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767228421; cv=none; b=EusJXTo7+Mig4H1DhHfzgcNhqY4bvYAc6f0CuGxttjqNDVHqZ88/SY1HPGdX7r3OtmwPpBz0DqHpdII8OUojz2948n/LhSBvZJRX25Sbjihe8dIenPHxJpRHjoOKc13RNMUNYEJ/PeHMrXa6vnWbXlcRDehji04nMkb4xAsFnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767228421; c=relaxed/simple;
	bh=BaGBcVWW84Ba/fUMMdhrDOk1qm1tF5P6mfCVCePEkzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VD7dUxwVfOKSbo9iw2lYbkE9XovQuRNhEWJBDAn6XaXFR8RaTcsfRgPEO2dpNL+kuXOwMiVPAeA/DYhV8ZTOvW66ABlzPy7pgH9cZn+HTa3cdRPALvHBMMDtdhFv6IAVCHFAOavhyEwqmI+9OmBtwdaHrNuz4DxQlzFQZXa4ZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIK/aghu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIK/aghu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767228416; x=1798764416;
  h=date:from:to:cc:subject:message-id;
  bh=BaGBcVWW84Ba/fUMMdhrDOk1qm1tF5P6mfCVCePEkzk=;
  b=gIK/aghujaOCWXQqLFd2WKlK4cmiybNSUwBQ2gWUFY3CcGJvjeD3WEZE
   wNSNH+BpLZIegPr5xRG5R5Vqj14C/H70NGO1DLYhpNZMLBP7wSD3GhiUS
   cCH/5SGluQe0YiskqIdJFkxyZQHMcvnZgWvWOW5lg+HUc6TwQk7m8N3sc
   TABoepN+yynQNznEPipXM6hXKBwRfsSpKtNVZlialqWznFXfCuFIwQjVj
   JfFfr7ljhU0qAfwUsQyaDySp93mJ87oVB3r8vFHeJSQ1f4kO4FOy9A4in
   Lsdrr208iOtqxdRtzAl3BJhyCt5Bjnk/aKTyaW32rD1M7B5trggBtpWZp
   A==;
X-CSE-ConnectionGUID: bfEpwC19TKqu3pZu97/PLQ==
X-CSE-MsgGUID: Ev/O5yPBQqqetXq0rd+Dhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79091717"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="79091717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 16:46:55 -0800
X-CSE-ConnectionGUID: cwk/OPpDQuCN8ByxdKunLg==
X-CSE-MsgGUID: CFKTstFiT2GVClMUrucrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201292221"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Dec 2025 16:46:53 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb6q3-0000000009h-0vJw;
	Thu, 01 Jan 2026 00:46:51 +0000
Date: Thu, 01 Jan 2026 01:46:00 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 43/43] progs/hid.c:487:18:
 error: incompatible pointer types passing 'struct bpf_wq *' to parameter of
 type 'struct bpf_wq *'
Message-ID: <202601010133.onjRXxo7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   11d0c8d1e2fa75d6946155211b11f463ebc307b1
commit: 380603d5f29a2265cb058a9ce5f2171f096ccca1 [43/43] Merge 2be6a7503d32 ("Merge tag 'trace-unused-v6.17' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace") into android-mainline
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260101/202601010133.onjRXxo7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010133.onjRXxo7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010133.onjRXxo7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   progs/hid_bpf_helpers.h:117:31: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                               ^
   progs/hid_bpf_helpers.h:118:32: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                ^
   progs/hid_bpf_helpers.h:119:44: error: declaration of 'struct bpf_wq' will not be visible outside of this function [-Werror,-Wvisibility]
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                            ^
   progs/hid.c:448:16: error: field has incomplete type 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                       ^
   progs/hid.c:448:9: note: forward declaration of 'struct bpf_wq'
     448 |         struct bpf_wq work;
         |                ^
>> progs/hid.c:487:18: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     487 |         if (bpf_wq_init(wq, &hmap, 0) != 0)
         |                         ^~
   progs/hid_bpf_helpers.h:117:39: note: passing argument to parameter 'wq' here
     117 | extern int bpf_wq_init(struct bpf_wq *wq, void *p__map, unsigned int flags) __weak __ksym;
         |                                       ^
   progs/hid.c:490:26: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                 ^~
   progs/hid_bpf_helpers.h:123:27: note: expanded from macro 'bpf_wq_set_callback'
     123 |         bpf_wq_set_callback_impl(timer, cb, flags, NULL)
         |                                  ^~~~~
   progs/hid_bpf_helpers.h:119:52: note: passing argument to parameter 'wq' here
     119 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |                                                    ^
   progs/hid.c:493:19: error: incompatible pointer types passing 'struct bpf_wq *' to parameter of type 'struct bpf_wq *' [-Werror,-Wincompatible-pointer-types]
     493 |         if (bpf_wq_start(wq, 0))
         |                          ^~
   progs/hid_bpf_helpers.h:118:40: note: passing argument to parameter 'wq' here
     118 | extern int bpf_wq_start(struct bpf_wq *wq, unsigned int flags) __weak __ksym;
         |                                        ^
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   8 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
