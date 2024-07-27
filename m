Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CF38FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722067643; cv=none; b=AEdRYi4lo99/iwgwwkdz/6F39g5KlyUYlB50EXzDNkl6ZYj3top/wgacbhb/gX5pOXwMAb0XwuqEGhjMZmEkRYzbZh5vWweDdvWrlo3mnZVutGOSAscGd8NgwIBjQQEIxb0ovgb/Y2IVYTYWhnNZwsvqrhvpzjjOcXKje0i9Gh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722067643; c=relaxed/simple;
	bh=mNltyQ0Niji0uTef/o6C4pdV6aWQhVKYlXlBFEpy8+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AuK3JEJQYP49fesXUxtHj73INrBnT0ZrRf85LfS/C98xX95ZxusFGFjjiGUaMsj3KHK3vmK1thT9H8TKtcB8MlcQ9t5t8992LmWwtRmYJmm29Xa8Na6u7PdLowh8bdrX8nDj+5cj4WgMpA6G7Uk8DJLAM2+zUeERLdzCXncEP4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IV7A7tnR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IV7A7tnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722067641; x=1753603641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNltyQ0Niji0uTef/o6C4pdV6aWQhVKYlXlBFEpy8+4=;
  b=IV7A7tnR5hu23HBP6F3XIXyLKU1ryl8sHkI4CirvriogPRzjAFFy3bSc
   09bNMSoH2jsaVZcC3iE/KDjyexhJTPSMFefHQ1JTsPejsr2SQIwCqdf0i
   pg5NklISLv8INmJjFMlpSD8JY8+UKVRrFJORpfKIdE+GwgopuNZg75/h/
   b+vSolKeZV0tU/lDa6IQcNjftk9rke6nzhgpk6ebEjbCGJ5ZT56llaVsS
   NOgv/ILYR3xmLhuOsGa44F9PnXk4SclFKNK7a6jvyRIPcplntF0gJwqIB
   T6edD4aJw+QLrBX4d60bbOhhKZtzMoG9Xrsb0duUbiaAunZhjVgqOpI3O
   Q==;
X-CSE-ConnectionGUID: +Z8y5q7hRfmI0hsJDGTppA==
X-CSE-MsgGUID: zBJnBZgDT4eyNsSYbxu/gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="45279585"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="45279585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 01:07:21 -0700
X-CSE-ConnectionGUID: ii3vca3bSaaO89w32kw2sA==
X-CSE-MsgGUID: uk19P9h4R9a2WuiiotknUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="53388130"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2024 01:07:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXcST-000pkS-0e;
	Sat, 27 Jul 2024 08:07:17 +0000
Date: Sat, 27 Jul 2024 16:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: [rust:rust-dev 27/31] warning: public documentation for `RBTree`
 links to private item `Node`
Message-ID: <202407271622.xpuOb9Ao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   84eb90da62a252b1f133f3c4f8a95c8c901f7ce2
commit: c443eba0860ab0f3dd6b56c93d68c794b2f95d5b [27/31] rust: rbtree: add red-black tree implementation backed by the C version
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240727/202407271622.xpuOb9Ao-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271622.xpuOb9Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271622.xpuOb9Ao-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: public documentation for `RBTree` links to private item `Node`
   --> rust/kernel/rbtree.rs:25:69
   |
   25 | /// valid, and pointing to a field of our internal representation [`Node`].
   |                                                                     ^^^^ this item is private
   |
   = note: this link will resolve properly if you pass `--document-private-items`
   = note: `#[warn(rustdoc::private_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
