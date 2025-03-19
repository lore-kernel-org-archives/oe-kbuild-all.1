Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766BC1A072A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742414865; cv=none; b=C/B5A7xklzZZ/25YalVMTQVHnr0kQnH4tIuvaz6vcpQSCgSxPESkgEuNO3pZNoESy7lj/xpwPQltDpTkkr0PS+fr6LYq9x4Zd47k27i2KCU51qrVmPgqvF3O8FQlygGBDi+mV/7ypPsG9N/8IpFmN722LRfXGkELgYX9DKbDiXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742414865; c=relaxed/simple;
	bh=KajJlusm2Bsb761MFpdJXjniMPu2JgCh803udkw/nB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKnGmgFD4Dbmivd30voNktVBfrbB8Lf1GXzBKrCsLxPnO/xGA3WfU6wkWuZq6p4cXf1M+t0rgSow50DKzKtYnqAVtJi3OakxXBJCZipINWJYZUsKh9W6ZzCYfGXT+p9Dc2ZaBWeKoxwSYSskvPPRlNS5BF3cxAUHKkCcCsEAYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBH2DkCb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBH2DkCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742414864; x=1773950864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KajJlusm2Bsb761MFpdJXjniMPu2JgCh803udkw/nB4=;
  b=MBH2DkCbWjKELv+QVBH+1Uq8SsB//N44WxcdAVRHFRO9yQjDg/FTu5N1
   YEkX5DIoVVWMZFGzHh2NV+Y9QrfC7/9beEXmC+DwWTzPzJZ+ToxU8qO9+
   kQ5mG5z2WU/OrS5uGk3aQ60S7Jy88aOS29aldS81pOc4f0c0LEXEMX5Uy
   GyB0zGSd7eQlwBmR+NGrfDvtAZiOuJAIXXZfLljijsB0Aq2zg2Ev0iTU9
   AXL+gsYODlYMAyz8ydvNLMu7wTfGMawg97JH42enrzpGLLzoEJjVgDgHP
   FPQZzzWB2Zxwx0hceOXkUB8m1YKi3YUdN6HnZByJe/p7m2BJ68wdl1qzB
   A==;
X-CSE-ConnectionGUID: mJhvto53Txm/8jGZnzygsg==
X-CSE-MsgGUID: 5bg9pNLkT3y0RDvmEIBU8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47399545"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="47399545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 13:07:43 -0700
X-CSE-ConnectionGUID: Rn4Mxy5dQ8GrgJUPlRKqiw==
X-CSE-MsgGUID: YARXD0HTRF+76+piprHK9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127862673"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2025 13:07:42 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuzhS-000Fdq-2y;
	Wed, 19 Mar 2025 20:07:39 +0000
Date: Thu, 20 Mar 2025 04:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC -next 04/10] splice: Add SPLICE_F_ZC and attach ubuf
Message-ID: <202503200330.NdABAJg7-lkp@intel.com>
References: <20250319001521.53249-5-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319001521.53249-5-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/splice-Add-ubuf_info-to-prepare-for-ZC/20250319-082153
base:   2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de
patch link:    https://lore.kernel.org/r/20250319001521.53249-5-jdamato%40fastly.com
patch subject: [RFC -next 04/10] splice: Add SPLICE_F_ZC and attach ubuf
config: um-randconfig-001-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200330.NdABAJg7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200330.NdABAJg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200330.NdABAJg7-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: fs/splice.o: in function `do_splice_direct_actor':
>> fs/splice.c:1232: undefined reference to `sock_from_file'
>> /usr/bin/ld: fs/splice.c:1236: undefined reference to `msg_zerocopy_realloc'
   collect2: error: ld returned 1 exit status


vim +1232 fs/splice.c

  1208	
  1209	static ssize_t do_splice_direct_actor(struct file *in, loff_t *ppos,
  1210					      struct file *out, loff_t *opos,
  1211					      size_t len, unsigned int flags,
  1212					      splice_direct_actor *actor)
  1213	{
  1214		struct splice_desc sd = {
  1215			.len		= len,
  1216			.total_len	= len,
  1217			.flags		= flags,
  1218			.pos		= *ppos,
  1219			.u.file		= out,
  1220			.splice_eof	= direct_file_splice_eof,
  1221			.opos		= opos,
  1222		};
  1223		ssize_t ret;
  1224	
  1225		if (unlikely(!(out->f_mode & FMODE_WRITE)))
  1226			return -EBADF;
  1227	
  1228		if (unlikely(out->f_flags & O_APPEND))
  1229			return -EINVAL;
  1230	
  1231		if (unlikely(flags & SPLICE_F_ZC)) {
> 1232			struct socket *sock = sock_from_file(out);
  1233			struct sock *sk = sock->sk;
  1234			struct ubuf_info *ubuf_info;
  1235	
> 1236			ubuf_info = msg_zerocopy_realloc(sk, len, NULL);
  1237			if (!ubuf_info)
  1238				return -ENOMEM;
  1239			sd.ubuf_info = ubuf_info;
  1240		}
  1241	
  1242		ret = splice_direct_to_actor(in, &sd, actor);
  1243		if (ret > 0)
  1244			*ppos = sd.pos;
  1245	
  1246		if (unlikely(flags & SPLICE_F_ZC))
  1247			refcount_dec(&sd.ubuf_info->refcnt);
  1248	
  1249		return ret;
  1250	}
  1251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
