Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FCB4AECD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 17:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709226831; cv=none; b=QMfANrw5TJZ25QtLM8c8fP+fJsQlcoITGLXsi7aBHEaUDosiic0jwwYZED2+tPSn29CeEUHoD8ZWrI6Xdrn7mEJZ6eGA7svYhgBh4iK6ClJUz193WDyjOH98PP1I2k+UytJvtmdmMPbiK+d08e7JYVmT4+2N1z83ZpcYowjW+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709226831; c=relaxed/simple;
	bh=CIpzkXJkrEae1+6rrPFMpdK/RnZItTSy5apZlWhXpn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ok4paRx218jaR2vK2tnF90KmJOiDpEbDQOsfMr/XjMSfr5mCLFqW2THwp/XXt60Co2izXwEQ0i2bENgqDmaYPq8Q+G2zP6/l3tf6W/pGHHqmwEVQWb5A26FMyWkxNajVwXqkCHxm+O3gE2yDuiMKADJgtxidOW5zIaxD+LZFSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQB1vo9Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQB1vo9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709226830; x=1740762830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CIpzkXJkrEae1+6rrPFMpdK/RnZItTSy5apZlWhXpn8=;
  b=EQB1vo9YMpZTweFHNfJpeYo3jpj/sSLBvBeXoyJVzmXdUpmC/Xs2U9Kg
   rKLOvaEEl9JV91p9cMBT9RXsdsHOnw2Xk5DDURzKEgj+HhoN1Y05RYLyY
   n6Rmy9Fs4m48oN5j8WS8yC40C5ynFbVjBOUr40+hMBCuDghXBguSTs5D8
   9CGhR/C9QJHpEctM/j961MoIa+u2ihOA2C1A3XeXPAGeIjgzoaoUouPqb
   3Vo/pv6ENmG0Qn4YPst4mUZXHClKlxIqtgxGG3ekXuRKkuy0k2mG2Xq9U
   WyVx4homWWLmJHCI9y7iW/eCRGI0rVQAdLx1P6u67WAJ4DSZD895Plk+G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14417824"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14417824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7766718"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 09:11:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfjwE-000D8J-2f;
	Thu, 29 Feb 2024 17:11:18 +0000
Date: Fri, 1 Mar 2024 01:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 30/30] fs/cachefiles/io.c:640:31:
 error: 'BIO_MAX_VECS' undeclared; did you mean 'BIO_MAX_SECTORS'?
Message-ID: <202403010140.MEEg8Qua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   afd4a14c1f0fde0fd833c3d1984c4ebb5981f7f8
commit: 920c10a555e2742546325940063cadc115de6a08 [30/30] netfs: Use writeback_iter()
config: nios2-randconfig-001-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010140.MEEg8Qua-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010140.MEEg8Qua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010140.MEEg8Qua-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/cachefiles/io.c: In function 'cachefiles_preprepare_write':
>> fs/cachefiles/io.c:640:31: error: 'BIO_MAX_VECS' undeclared (first use in this function); did you mean 'BIO_MAX_SECTORS'?
     640 |         subreq->max_nr_segs = BIO_MAX_VECS;
         |                               ^~~~~~~~~~~~
         |                               BIO_MAX_SECTORS
   fs/cachefiles/io.c:640:31: note: each undeclared identifier is reported only once for each function it appears in


vim +640 fs/cachefiles/io.c

   624	
   625	static int cachefiles_preprepare_write(struct netfs_io_subrequest *subreq)
   626	{
   627		struct netfs_io_request *wreq = subreq->rreq;
   628		struct netfs_cache_resources *cres = &wreq->cache_resources;
   629	
   630		_enter("W=%x[%x] %llx", wreq->debug_id, subreq->debug_index, subreq->start);
   631	
   632		if (!cachefiles_cres_file(cres)) {
   633			if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
   634				return -ENOBUFS;
   635			if (!cachefiles_cres_file(cres))
   636				return -ENOBUFS;
   637		}
   638	
   639		subreq->max_len = 16384; //ULONG_MAX;
 > 640		subreq->max_nr_segs = BIO_MAX_VECS;
   641		return 0;
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
