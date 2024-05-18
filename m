Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF3C2836A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716028202; cv=none; b=vENDmk9UqHY/ulLZzbxieo6GZ9qpMwPlis6cq3yC0VTltHJUnpX9oh5znSdnMDH6S7v6B9tOePuFMH4rOXMv8epSI1e6FIOhQhDWpUZF4TO1tGzCO6XblYVI84JmDF4MUzxW6m5WI7Za0L08V1xsT87/A9lwcG7ycyeIjIjHMGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716028202; c=relaxed/simple;
	bh=WtVqqJUUsYqdofzOCB5FcvNH9Zt1KwujQUrpLa6u8RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMMD4ksqLVjwdYuQtgXaMMZDgPL20CoP625I4TDqdP35SRILjYBckEBcIsF5WeqF3no8FoKLgOsSagj93tX4jtmzR1RPgQG6HMIUMy+SoOXI3vI31VD9JfCkhKZXfIJEr9uZNI0Tp5OEP2D07bXwDwgR5p/mOVPF+2HgQxMf8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZC/CRUFp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC/CRUFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716028199; x=1747564199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WtVqqJUUsYqdofzOCB5FcvNH9Zt1KwujQUrpLa6u8RU=;
  b=ZC/CRUFpj1Xxhs12RoiduKheI5fiWzrX7ygKRnbrMNQ/Kc+2XFLNn2Xp
   CuOR0RWJtyPyXsUbdPcYKCsEbJn2X5xT5FnrORrGTe4IHJ+orc6hr2u8C
   wE0+HlShQLv2/9Gclw98CWt7RMOYSMOtlsKCZIHGYJrC6ieS+xpRVdpYH
   JFOI7I+L1b8RaiWKrKHzW60Kf9cyAxpMUx21xEfC17Xi/1oZLpuKqVLte
   caSkD1wRgTGFa3eXFOnpbJ0QWfZ6hz8Mg7YIsTNKTXkemdONQ2IZL15/m
   Uxas4xnvOmeCFSKtsjtCHhyh5GqiK6EKeM40/inFiedVvCC8Ni5GeDqno
   w==;
X-CSE-ConnectionGUID: JodR66MJTMK5V+Cep7p7Ww==
X-CSE-MsgGUID: NygfG/NsT+ydfPX5oVCw/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12056079"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12056079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 03:29:59 -0700
X-CSE-ConnectionGUID: sZAAQGOuQoyAOr1DNi3zdQ==
X-CSE-MsgGUID: DA7KJnRyRKWuKaAmlPBWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="32201831"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2024 03:29:58 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8HK7-00025o-2f;
	Sat, 18 May 2024 10:29:55 +0000
Date: Sat, 18 May 2024 18:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/5] vsock/virtio: Add support for multi-devices
Message-ID: <202405181835.S8GZNYM3-lkp@intel.com>
References: <20240517144607.2595798-3-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517144607.2595798-3-niuxuewei.nxw@antgroup.com>

Hi Xuewei,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewei-Niu/vsock-virtio-Extend-virtio-vsock-spec-with-an-order-field/20240517-225120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20240517144607.2595798-3-niuxuewei.nxw%40antgroup.com
patch subject: [RFC PATCH 2/5] vsock/virtio: Add support for multi-devices
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181835.S8GZNYM3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181835.S8GZNYM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181835.S8GZNYM3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:549:6: warning: no previous prototype for 'transport_g2h_verify_cid' [-Wmissing-prototypes]
     549 | bool transport_g2h_verify_cid(unsigned int cid)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/vmw_vsock/af_vsock.c: In function 'vsock_dgram_sendmsg':
>> net/vmw_vsock/af_vsock.c:1231:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    1231 |                 if (remote_addr->svm_cid == VMADDR_CID_ANY)
         |                    ^
   net/vmw_vsock/af_vsock.c:1246:20: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    1246 |                 if (remote_addr->svm_cid == VMADDR_CID_ANY)
         |                    ^


vim +/transport_g2h_verify_cid +549 net/vmw_vsock/af_vsock.c

   548	
 > 549	bool transport_g2h_verify_cid(unsigned int cid)
   550	{
   551		/* transports that support multi devices */
   552		rcu_read_lock();
   553		if (transport_g2h->get_virtio_vsock &&
   554		    (cid == VMADDR_CID_ANY || transport_g2h->get_virtio_vsock(cid))) {
   555			rcu_read_unlock();
   556			return true;
   557		}
   558		rcu_read_unlock();
   559		/* other transports */
   560		if (cid == transport_g2h->get_local_cid())
   561			return true;
   562	
   563		return false;
   564	}
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
