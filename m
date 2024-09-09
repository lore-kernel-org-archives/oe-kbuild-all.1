Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999217C7D5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910071; cv=none; b=E2nrEdrQr6ASKFf5bL3Lp9PsyTQTNYDs50WRVxoaftGvdlehw4KKDhd/DhtIn/R5j03p5z2dlb35loU2r7ojtqvVQze3YWSkQO+jUCWbOX2GcqfBBSevJ2BjuFk1P1U6k01EIxd2Om7+QHsEkbByzBDF9++Y6NtqBPI40Spbflg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910071; c=relaxed/simple;
	bh=FM6j7YQj3MoKoEGd67AnjEMmNeso1XwGJK2Z/bCg/bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvtCexGwVD17dlMj6Lj0D1XNGSsQo4irrGY5zJ/vwV/2/iLxeXNSHiSvIHl/1UxVnetxabmwOcq1hGdxahuDZLawhx5MvbpCwwI25suDdWH9aKbUionFmoo0GItZss2HZ3abduT6ogV62U5q/BgOIyobrBMaZy/7eBvKQUH3fjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cT/i0gWU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cT/i0gWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725910069; x=1757446069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FM6j7YQj3MoKoEGd67AnjEMmNeso1XwGJK2Z/bCg/bU=;
  b=cT/i0gWUj2+DrtlhIFRavkcMEv0yj9SoseZwAzsm0BGAHBeK/DAzgQE9
   8q4IUlSZ/8+tjpvrAnXN9Etr9swpUObttY8q2w0dKjpqpnYJvVRroXaiK
   oV0a6XoADtXskcVURzZgyIlc+4ey8dUCnb2dlSLhnLM1RTHnNFnSgdapb
   13rRIP/mVP5667YHCnj0CLjKXZKwUILHDmz9EyvPUfs++o8e81OOKT78e
   qHFO8Z5utmmm+/WWpb7VaIPbjWkm0HgIJOJ1+jm+XnP+7tYwl/JQft4T/
   QvIuNlFWuIAck95tacrpl/iaqp1VQrHeqi1fgpQVINv0qdjBzFy4XbpG6
   w==;
X-CSE-ConnectionGUID: 1JylM7YvSPufTOvS2R4JmQ==
X-CSE-MsgGUID: Xdf2By/kRqGpPkyWzYxtcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24819077"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24819077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 12:27:49 -0700
X-CSE-ConnectionGUID: KCuoApggTXKLe4Ei/eV1hg==
X-CSE-MsgGUID: R89cixgbS2SBIH6w4h77SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67037997"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2024 12:27:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snk38-000F8c-05;
	Mon, 09 Sep 2024 19:27:46 +0000
Date: Tue, 10 Sep 2024 03:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 209/258]
 include/linux/pipe_fs_i.h:274:29: warning: 'struct iov_iter' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202409100312.OM4xSTGF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 79e9f469b262e253396d71d7af0945da30a61cd0 [209/258] bcachefs: convert thread_with_stdio to pipes WIP
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240910/202409100312.OM4xSTGF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100312.OM4xSTGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100312.OM4xSTGF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/splice.h:12,
                    from net/tls/tls_sw.c:42:
>> include/linux/pipe_fs_i.h:274:29: warning: 'struct iov_iter' declared inside parameter list will not be visible outside of this definition or declaration
     274 |                      struct iov_iter *to,
         |                             ^~~~~~~~
   include/linux/pipe_fs_i.h:277:30: warning: 'struct iov_iter' declared inside parameter list will not be visible outside of this definition or declaration
     277 |                       struct iov_iter *to,
         |                              ^~~~~~~~


vim +274 include/linux/pipe_fs_i.h

   272	
   273	ssize_t do_pipe_read(struct pipe_inode_info *pipe,
 > 274			     struct iov_iter *to,
   275			     bool nonblock);
   276	ssize_t do_pipe_write(struct pipe_inode_info *pipe,
   277			      struct iov_iter *to,
   278			      bool nonblock,
   279			      bool is_packetized);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
