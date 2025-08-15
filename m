Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4651831770A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279902; cv=none; b=nzdjNn7lbVBJI4Oeq3PIWLznEBmqPmdVSr466x1GIiVaOoqLoIo1jBVZWFm+/MqvUruN2v3TqGEASDfnodL8+DOOb2ZvVgHD0TmDaUgUGINKTDAFtRdW8+88ItllUlJXDuTP3Ekz30Z231fe0BTea3Ox7jJOzR1Icnww9TgMR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279902; c=relaxed/simple;
	bh=E9Vu+z8Vyb8k/alWS7Ulc+4+X6N6THMhy2g4v67vr6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUHa2v10xXVUXcvt4z2jBAELDPG0lJQKT81cAIWcfsdvyRbBElLRHxWa0P/Ohof/1sYcUQCLDwgwmzll0iWhW/hnn9RzseQwnZqJp0nK+N8C6Rpn84N6RruSoOb10TccPze41ZIv60iTcgXk0wmnHvRENmcUjhO4WuqF6xzlp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLkfKxeB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLkfKxeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755279900; x=1786815900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9Vu+z8Vyb8k/alWS7Ulc+4+X6N6THMhy2g4v67vr6U=;
  b=TLkfKxeBsHpj6jZggt3qrPp7e8QQ704byjdEgcNNMC/3l6WHD4spW3xt
   TGLUb0h9QSEebmpfvL0iw+P2HSWcbCItcYGIWgizt+OdmkUuPZwwb3vYw
   5p24rwBHRCzROjXw+VKChCexdbjhrfWc8lXU2b+r+cacepEfVd5Qj9WkQ
   1uXUfxemzeZLpCZSrHofNBV8oqsbRIGJRhgMQcd5yeIYizMquHaJqAsP9
   UV9yqwK2AKh8LAVdyxHt0f/NvdpjW3dtXaz4ZFXmVA3Dnwwu6fQyfdFEo
   2RQvyt5C0fqH0Eu8snMEtDZiK1iwMdnaYwSgo9K86rR5u/i06m+aEwtX0
   g==;
X-CSE-ConnectionGUID: /H3iv0lOR3Gb7DrqpyJ4BQ==
X-CSE-MsgGUID: MXdwKDiTT/+tX3Lqef8TIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="60231919"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="60231919"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 10:44:59 -0700
X-CSE-ConnectionGUID: DhGgL0ZbRY+1O+vK6LT45A==
X-CSE-MsgGUID: u5uqLaceRCusY1p6dSx2tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198053627"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Aug 2025 10:44:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umyU3-000CC8-25;
	Fri, 15 Aug 2025 17:44:55 +0000
Date: Sat, 16 Aug 2025 01:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [brauner-github:vfs-6.18.iomap 1/1] fs/iomap/direct-io.c:281:36:
 warning: initialization of 'struct folio *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202508160103.feZXu0ig-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.18.iomap
head:   5589673e8d8d31ff2cec82181676c510e5afdb8d
commit: 5589673e8d8d31ff2cec82181676c510e5afdb8d [1/1] iomap: use largest_zero_folio() in iomap_dio_zero()
config: x86_64-buildonly-randconfig-003-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160103.feZXu0ig-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160103.feZXu0ig-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160103.feZXu0ig-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/direct-io.c: In function 'iomap_dio_zero':
   fs/iomap/direct-io.c:281:36: error: implicit declaration of function 'largest_zero_folio'; did you mean 'is_zero_folio'? [-Werror=implicit-function-declaration]
     281 |         struct folio *zero_folio = largest_zero_folio();
         |                                    ^~~~~~~~~~~~~~~~~~
         |                                    is_zero_folio
>> fs/iomap/direct-io.c:281:36: warning: initialization of 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +281 fs/iomap/direct-io.c

   275	
   276	static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
   277			loff_t pos, unsigned len)
   278	{
   279		struct inode *inode = file_inode(dio->iocb->ki_filp);
   280		struct bio *bio;
 > 281		struct folio *zero_folio = largest_zero_folio();
   282		int nr_vecs = max(1, i_blocksize(inode) / folio_size(zero_folio));
   283	
   284		if (!len)
   285			return 0;
   286	
   287		/*
   288		 * This limit shall never be reached as most filesystems have a
   289		 * maximum blocksize of 64k.
   290		 */
   291		if (WARN_ON_ONCE(nr_vecs > BIO_MAX_VECS))
   292			return -EINVAL;
   293	
   294		bio = iomap_dio_alloc_bio(iter, dio, nr_vecs,
   295					  REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
   296		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
   297					  GFP_KERNEL);
   298		bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
   299		bio->bi_private = dio;
   300		bio->bi_end_io = iomap_dio_bio_end_io;
   301	
   302		while (len > 0) {
   303			unsigned int io_len = min(len, folio_size(zero_folio));
   304	
   305			bio_add_folio_nofail(bio, zero_folio, io_len, 0);
   306			len -= io_len;
   307		}
   308		iomap_dio_submit_bio(iter, dio, bio, pos);
   309	
   310		return 0;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
