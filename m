Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F08F38DE5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716531933; cv=none; b=q7JYJd6RL8fe56oySx2XcFrNMuSsO1MfV4pwbAk5QYfuxErLNe7dYYwrWQ20MHb/tQXTTF7Ho973KwLdwLEgdfcmwElD2z35IjA/luHuSSLKeDfqSPS+57BNUKkR5sRlngmogAzEJG4YtU8t1P7PXLd7Hhh+LfWSzierxP1277I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716531933; c=relaxed/simple;
	bh=K1dWnbRB7DLAumJMqQCpbv44ZS3RgNNIWt9igErc37o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0wftDGUePTJ3juoPVddcDax+zvKGI9Qnw8zYOhuefi7hqdklndJHZIppIuexxH3QvJQlIjsuZU3vUNkho224wbdvaOh5Pc6GvL3EC8AQlmIPC/LmEt1J+nOEaWDDian76NT5UWp1v0i+d5U2AHfVxIAV5Iuf4E2AW4xb17JVCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caPyL0ZD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caPyL0ZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716531932; x=1748067932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1dWnbRB7DLAumJMqQCpbv44ZS3RgNNIWt9igErc37o=;
  b=caPyL0ZDn9pSx/kqR5/2/0tTX6fC4ry87G0eU4RBVtfXYeXYI6cVlNx+
   WHOWjB0GYuir1ZPGaOGUWyB5/5huxBfNoBnG1HgrDROkqSxJCgcmzI1Gk
   cg6rUZ+iy8y9jSvEufhJ7eLsP5rRNP6NBaiLNDdVN2zJJIjVKu6NhZRIn
   h0QZGTLtfrKlN3Pd7TIIDacog2m8/l+0iKRoFUXZ0UJMlTSXIvGworllv
   gJGm8HzZkHXtCD2FcwlEIW/RZK07Kwg/X6lKztSGOeo/Z+wF/oYieQuZ2
   qx1XOjfUrgib2y86+q/6IIa2ShSNaeaZneYXB5j8BGayfVQcZCow0A1WP
   Q==;
X-CSE-ConnectionGUID: hsX4ojO3Rt+vFlwDIP6BPA==
X-CSE-MsgGUID: 5SsdOe2oRmGTmI6LDsxTBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="23502828"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="23502828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 23:25:32 -0700
X-CSE-ConnectionGUID: T7tm/7hXRpGIAUzF5WpDWw==
X-CSE-MsgGUID: h1YDqMASTqmsQlbtdG2Eww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; 
   d="scan'208";a="38331785"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2024 23:25:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAOMq-0003x7-0Q;
	Fri, 24 May 2024 06:25:28 +0000
Date: Fri, 24 May 2024 14:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Boris Burkov <boris@bur.io>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 58/67] fs/btrfs/space-info.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.unreachable
Message-ID: <202405241457.EXK2T1FD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   87432b1fbf96ce1a101d2f2eba02257ff559f829
commit: aa07e8b0f1975875cfa65c7eaa3ca859a93a60a8 [58/67] btrfs: prevent pathological periodic reclaim loops
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240524/202405241457.EXK2T1FD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241457.EXK2T1FD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241457.EXK2T1FD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/space-info.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
