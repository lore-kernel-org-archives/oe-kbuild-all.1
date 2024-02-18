Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB729A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 06:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708236510; cv=none; b=g8z6F9DTHmauVsSn5LaB0uX82Q8Y3ctdaAWZlncopd0fBwa/A1tlJaC0bIE0ir893oCo98WVjDL9qxucXUUKeK5l38cQrSKnDq9f9JdCgd2MjPn/jKOwBIs2V78tCJhd7wdECjUUa05DzqzY0P6LZERoI1LV+gHfnod4VAo2SuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708236510; c=relaxed/simple;
	bh=RySsgCP/EBvaUh5PZm3c+1pasnN98ZL0YqjBRmvOuF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7XDuvaxBAGNc2DRFWAQL+5butIIaC9H6uEZxttf0AyMtwGQpyHOY+3q4aq16KWcXy+bFf3UMQUP1gpOWgc1FGL+u5yOOvsEn9g11zmBNaJPxo8JBebX/ESjBF2LiXGsKl0sqkgyJHdxZR1LIJ2nqwB24Mk18LMBcmnuOEsgIWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp7XQuj5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp7XQuj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708236508; x=1739772508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RySsgCP/EBvaUh5PZm3c+1pasnN98ZL0YqjBRmvOuF8=;
  b=Jp7XQuj5rAZvm1lRaVroCUr/+Uy+iK/R2yjZFMkSeiJ14L/+DALWPu5z
   vGkLh7K/qsNACHh8gWJ3Wnkm5Ftek3akGppO331VjcxwkBWmFxDqi4/nq
   9kKwCHW42mdvDZHPGg5qbMvGtwaV2gf5a+Jn10GWfJB2LzYUMJO9MXjsT
   Z0O5HHIOlNACRsdqhrvTn0x+yzsf1yKTKNOnAVVSiTZ9QvdVZLt6Q0C2S
   OZRzpoVdrxgYnpuFySGyUyYWn/qffKf+eiCk19ozpXwjfcmH1qlClaLxH
   iZ04uUuRLGGbKfevZWH8/mwT4MQh9P+LjXdepFm/u8HC+kEi7UkM13I1r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2456832"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2456832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 22:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4102281"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2024 22:08:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbaLg-0002pe-2d;
	Sun, 18 Feb 2024 06:08:24 +0000
Date: Sun, 18 Feb 2024 14:07:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] error: mutable borrow from
 immutable input(s)
Message-ID: <202402181401.Bg5fvRn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b1661c9e45f69f710f14b71da7c91fd38f63b19a
commit: b1661c9e45f69f710f14b71da7c91fd38f63b19a [1/1] ANDROID: rust: add linked list implementation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240218/202402181401.Bg5fvRn5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181401.Bg5fvRn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181401.Bg5fvRn5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: mutable borrow from immutable input(s)
   --> rust/kernel/list/arc_field.rs:53:40
   |
   53 |     pub unsafe fn assert_mut(&self) -> &mut T {
   |                                        ^^^^^^
   |
   note: immutable borrow here
   --> rust/kernel/list/arc_field.rs:53:30
   |
   53 |     pub unsafe fn assert_mut(&self) -> &mut T {
   |                              ^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#mut_from_ref
   = note: `-D clippy::mut-from-ref` implied by `-D clippy::correctness`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
