Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC7354ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0dtRAH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696981841; x=1728517841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+GvDPoy4U4If1EQtSuAaBE7DLoAjx7mV2TsimxYdAvw=;
  b=i0dtRAH4pL8vsDWEyhDN7ZAuYUfMDQKaHWCj43DywISDNczxtiV47ZQk
   lxplI3/l5HbKkuBAX3r2Rt6UDlVu/++aHxpx+Rt60keokGszmQieHqWMZ
   QxxunetK97MW6sJYZDk8Z1w+X2aimlfX3bGaVmZyHSFMlBp6sBgofl9UK
   mQvKaLXEk+cBfvjZE2KhP498eMfJ/iackRQRhL/2+9wSorILFaNiQJDDl
   yZlHS0YZsRWufpN1Q1h4QmdK4v5WnqoscaBEpgeJOZf+Ops7Yewildbzu
   zL3uK1oZdSQQ5AaUuRM20Yz4NsxC1nZq1kOQkSt1w/mBKh0H5Xz0aTa+U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387383701"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="387383701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 16:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="730284378"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="730284378"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Oct 2023 16:50:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqMUn-0001Oy-1n;
	Tue, 10 Oct 2023 23:50:37 +0000
Date: Wed, 11 Oct 2023 07:49:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/1] drm/virtio: Support fence-passing feature
Message-ID: <202310110750.xrrPfuet-lkp@intel.com>
References: <20231007194747.788934-2-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007194747.788934-2-dmitry.osipenko@collabora.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.6-rc5 next-20231010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/drm-virtio-Support-fence-passing-feature/20231008-035132
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231007194747.788934-2-dmitry.osipenko%40collabora.com
patch subject: [RFC PATCH v1 1/1] drm/virtio: Support fence-passing feature
config: i386-randconfig-062-20231011 (https://download.01.org/0day-ci/archive/20231011/202310110750.xrrPfuet-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110750.xrrPfuet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110750.xrrPfuet-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/virtio/virtgpu_submit.c:414:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __le64 [usertype] @@
   drivers/gpu/drm/virtio/virtgpu_submit.c:414:30: sparse:     expected unsigned long long [usertype]
   drivers/gpu/drm/virtio/virtgpu_submit.c:414:30: sparse:     got restricted __le64 [usertype]

vim +414 drivers/gpu/drm/virtio/virtgpu_submit.c

   394	
   395	static int virtio_gpu_attach_in_fences(struct virtio_gpu_submit *submit)
   396	{
   397		size_t in_fences_size = sizeof(u64) * submit->num_in_fences;
   398		size_t new_data_size = submit->data_size + in_fences_size;
   399		void *buf = submit->buf;
   400		u64 *in_fences;
   401		unsigned int i;
   402	
   403		if (new_data_size < submit->data_size)
   404			return -EINVAL;
   405	
   406		buf = kvrealloc(buf, submit->data_size, new_data_size, GFP_KERNEL);
   407		if (!buf)
   408			return -ENOMEM;
   409	
   410		memmove(buf + in_fences_size, buf, submit->data_size);
   411		in_fences = buf;
   412	
   413		for (i = 0; i < submit->num_in_fences; i++)
 > 414			in_fences[i] = cpu_to_le64(submit->in_fences[i].id);
   415	
   416		submit->data_size = new_data_size;
   417		submit->buf = buf;
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
