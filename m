Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3111333E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765546158; cv=none; b=YCpD3EJkMPukxrxp99KKNkqFpzvkstNjq6lKWgnnSOd5f1ZcOP0icKIBULegInVE224+OeRI/xc0BaEbpPnsEgEgYelZ5fIKauzIGapg3DWzKRj9eYXnhlMoaECuztubqEDmn/rST8tEOMCw5tTKvbmnbPz6mXQG5oJhNmUJSGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765546158; c=relaxed/simple;
	bh=ObXNOkdQLOyqw1nZrIHI/vMtLNDs9MM0lg33uzvXZzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBO6uhBk51NHmfG4GjIv1lu4LPoq6CNHmL8qNXc3FV4AczIWx5D6LDtfyPQLVq4N7wvkQh2l9nyO7+rxgRrN/e+LBcd6cQEPCSWHoxouMVFfU0MWlxvqQtSiZ6a3H/1VpYYNvmlPFVrWG8I6OmU9XiBbauVd1HFe7H2l41GLPw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkV0DX/Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkV0DX/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765546157; x=1797082157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObXNOkdQLOyqw1nZrIHI/vMtLNDs9MM0lg33uzvXZzo=;
  b=bkV0DX/YG8hQbM5/GJVrk80abiVcF9g7dBsI7BAl62NG7/UC0OOJLLUl
   C422ZAQqQPBcGh48RkYcBNt81x2t/bLHTHsu1aqGRlqCbkomCd4CoGIe8
   YKtZb8d4TbtUTn8W1E41wL7mrirQSAAR96MNxw+l1t+Fwgou5kd6jJSIy
   sHMYdVilro2Ou+y2SzaEwzSxZHJfyzAVWbbgdYw0ldJQrNclxoT7ALeuv
   9z560gfr22GvKk45Dr6xSmAJeVk09MEOAPpAb+yCtNmlH39bubXRLEF4c
   w0EcvJOApFgxP9xwyFvtfzCtyXgB1Z1mr3QfgAY+OdRDJ7zdU3eeYfCo2
   w==;
X-CSE-ConnectionGUID: /CEeN/jIQRGdYMdxE9rlpg==
X-CSE-MsgGUID: iQDSjHvlRNKeE9yWDLBa9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67431775"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67431775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:29:16 -0800
X-CSE-ConnectionGUID: lPduLCaNR2KZ1C+Zg5Wvnw==
X-CSE-MsgGUID: wbMj/PFuRoGF/Y5t8gjJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196843930"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 05:29:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3Cp-000000001ie-2QOa;
	Fri, 12 Dec 2025 13:29:11 +0000
Date: Fri, 12 Dec 2025 14:29:09 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 11/11] usr/include/linux/rseq.h:77:8: error:
 redefinition of 'rseq_slice_ctrl'
Message-ID: <202512121442.qiGxk4qp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c
commit: 32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c [11/11] selftests/rseq: Implement time slice extension test
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512121442.qiGxk4qp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121442.qiGxk4qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121442.qiGxk4qp-lkp@intel.com/

Note: the tglx-devel/rseq/slice HEAD 32ea77d4fbbfee4d7fc9747bf8037c42b3fa6c8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from rseq_test.c:24:
>> usr/include/linux/rseq.h:77:8: error: redefinition of 'rseq_slice_ctrl'
      77 | struct rseq_slice_ctrl {
         |        ^
   ./../rseq/rseq-abi.h:66:8: note: previous definition is here
      66 | struct rseq_slice_ctrl {
         |        ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
