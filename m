Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536D23EA91
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631679; cv=none; b=aWRiHbSIlWAjdS2nqNNsWO+Yg215uk2SOH4qVdCta3p9Cz5G7/8bewblI3eCrkXoifS9PexeIrnqYP7EfUtHJNSGqczyz4n2VuN9lH5/SIS6z/TZB+N2VV102b454q+c4K0FjVm2AzY8nYKe81tT4wFvKprYDdiGh5Q6GE/tQow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631679; c=relaxed/simple;
	bh=3LY7ydKvc14vniHQf7yDNEz9E3bD3kibr2OTyjJsy6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY8Q/C1cp3fpWAyZ8PIFdDQv3tmJ5OebyhNry1qBDURlpfxE1D6a6rSiVd23WzVSonELjE+bNHVuSj1CcFgg1Waker7b8fUUWvPqecqF4Oht/Rv/akRNDW/BfoHCbX5HSbdVR9YYhEic9nwhR0tRu77BvTHTmeRDjeNjFtAwWX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApS55mBQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApS55mBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760631678; x=1792167678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3LY7ydKvc14vniHQf7yDNEz9E3bD3kibr2OTyjJsy6w=;
  b=ApS55mBQxZgipHl8Owe5bZrFiadxk4Sn4cOyPvz4sDM+wGQXrLMpLQPG
   OoVMPrGuzFyeAfS2gt9ZVcUghyjx9dGTYH12T9TVYEPdP9WjeBN29VwFP
   SVOL7J/WmghLhcdL7zCxOu9YcGaFZtTOFBCl7jrHaLPVdpZpcJ70bqI7i
   HirZwqHCf9L9wzNOlDgJAUXaGZjL363FQP7rqetYdIjeSIsji9CITFuHH
   FUutSqPZYLI6abkrPMEsKRsljdTxMgOFAMwf4em6C/TjKckrBePh5e7QE
   PYvxo3n3G0XXGJFD3mxsCxihi9CCM/F8TdEkaqdG7BkJfLQBWZUsx0o9r
   g==;
X-CSE-ConnectionGUID: iYbd2VFAR/SkIFEzBE6gUQ==
X-CSE-MsgGUID: ouUuz9n7TNii2o7NxCVf7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62540206"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62540206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 09:21:17 -0700
X-CSE-ConnectionGUID: nm7N/gheQYGdthDt8TQpvg==
X-CSE-MsgGUID: 29rtIuyVR1GmzXjSmdJ5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182062661"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Oct 2025 09:21:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Qj3-00051r-18;
	Thu, 16 Oct 2025 16:21:13 +0000
Date: Fri, 17 Oct 2025 00:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 04/10] net: Convert proto_ops connect() callbacks to
 use sockaddr_unspec
Message-ID: <202510170038.V0Mn8tli-lkp@intel.com>
References: <20251014224334.2344521-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014224334.2344521-4-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20251015]
[cannot apply to bluetooth/master bpf/master bpf-next/net bpf-next/master linus/master v6.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/net-Add-struct-sockaddr_unspec-for-sockaddr-of-unknown-length/20251015-064816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014224334.2344521-4-kees%40kernel.org
patch subject: [PATCH v2 04/10] net: Convert proto_ops connect() callbacks to use sockaddr_unspec
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251017/202510170038.V0Mn8tli-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170038.V0Mn8tli-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170038.V0Mn8tli-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/qmi/qmi_sample_client.c: In function 'qmi_sample_probe':
>> samples/qmi/qmi_sample_client.c:471:48: error: passing argument 2 of 'kernel_connect' from incompatible pointer type [-Wincompatible-pointer-types]
     471 |         ret = kernel_connect(sample->qmi.sock, (struct sockaddr *)sq,
         |                                                ^~~~~~~~~~~~~~~~~~~~~
         |                                                |
         |                                                struct sockaddr *
   In file included from samples/qmi/qmi_sample_client.c:14:
   include/linux/net.h:351:65: note: expected 'struct sockaddr_unspec *' but argument is of type 'struct sockaddr *'
     351 | int kernel_connect(struct socket *sock, struct sockaddr_unspec *addr, int addrlen,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/kernel_connect +471 samples/qmi/qmi_sample_client.c

842891be96bd2b Bjorn Andersson 2017-06-26  452  
842891be96bd2b Bjorn Andersson 2017-06-26  453  static int qmi_sample_probe(struct platform_device *pdev)
842891be96bd2b Bjorn Andersson 2017-06-26  454  {
842891be96bd2b Bjorn Andersson 2017-06-26  455  	struct sockaddr_qrtr *sq;
842891be96bd2b Bjorn Andersson 2017-06-26  456  	struct qmi_sample *sample;
842891be96bd2b Bjorn Andersson 2017-06-26  457  	char path[20];
842891be96bd2b Bjorn Andersson 2017-06-26  458  	int ret;
842891be96bd2b Bjorn Andersson 2017-06-26  459  
842891be96bd2b Bjorn Andersson 2017-06-26  460  	sample = devm_kzalloc(&pdev->dev, sizeof(*sample), GFP_KERNEL);
842891be96bd2b Bjorn Andersson 2017-06-26  461  	if (!sample)
842891be96bd2b Bjorn Andersson 2017-06-26  462  		return -ENOMEM;
842891be96bd2b Bjorn Andersson 2017-06-26  463  
842891be96bd2b Bjorn Andersson 2017-06-26  464  	ret = qmi_handle_init(&sample->qmi, TEST_DATA_REQ_MAX_MSG_LEN_V01,
842891be96bd2b Bjorn Andersson 2017-06-26  465  			      NULL,
842891be96bd2b Bjorn Andersson 2017-06-26  466  			      qmi_sample_handlers);
842891be96bd2b Bjorn Andersson 2017-06-26  467  	if (ret < 0)
842891be96bd2b Bjorn Andersson 2017-06-26  468  		return ret;
842891be96bd2b Bjorn Andersson 2017-06-26  469  
842891be96bd2b Bjorn Andersson 2017-06-26  470  	sq = dev_get_platdata(&pdev->dev);
842891be96bd2b Bjorn Andersson 2017-06-26 @471  	ret = kernel_connect(sample->qmi.sock, (struct sockaddr *)sq,
842891be96bd2b Bjorn Andersson 2017-06-26  472  			     sizeof(*sq), 0);
842891be96bd2b Bjorn Andersson 2017-06-26  473  	if (ret < 0) {
842891be96bd2b Bjorn Andersson 2017-06-26  474  		pr_err("failed to connect to remote service port\n");
842891be96bd2b Bjorn Andersson 2017-06-26  475  		goto err_release_qmi_handle;
842891be96bd2b Bjorn Andersson 2017-06-26  476  	}
842891be96bd2b Bjorn Andersson 2017-06-26  477  
842891be96bd2b Bjorn Andersson 2017-06-26  478  	snprintf(path, sizeof(path), "%d:%d", sq->sq_node, sq->sq_port);
842891be96bd2b Bjorn Andersson 2017-06-26  479  
842891be96bd2b Bjorn Andersson 2017-06-26  480  	sample->de_dir = debugfs_create_dir(path, qmi_debug_dir);
842891be96bd2b Bjorn Andersson 2017-06-26  481  	if (IS_ERR(sample->de_dir)) {
842891be96bd2b Bjorn Andersson 2017-06-26  482  		ret = PTR_ERR(sample->de_dir);
842891be96bd2b Bjorn Andersson 2017-06-26  483  		goto err_release_qmi_handle;
842891be96bd2b Bjorn Andersson 2017-06-26  484  	}
842891be96bd2b Bjorn Andersson 2017-06-26  485  
842891be96bd2b Bjorn Andersson 2017-06-26  486  	sample->de_data = debugfs_create_file("data", 0600, sample->de_dir,
842891be96bd2b Bjorn Andersson 2017-06-26  487  					      sample, &data_fops);
842891be96bd2b Bjorn Andersson 2017-06-26  488  	if (IS_ERR(sample->de_data)) {
842891be96bd2b Bjorn Andersson 2017-06-26  489  		ret = PTR_ERR(sample->de_data);
842891be96bd2b Bjorn Andersson 2017-06-26  490  		goto err_remove_de_dir;
842891be96bd2b Bjorn Andersson 2017-06-26  491  	}
842891be96bd2b Bjorn Andersson 2017-06-26  492  
842891be96bd2b Bjorn Andersson 2017-06-26  493  	sample->de_ping = debugfs_create_file("ping", 0600, sample->de_dir,
842891be96bd2b Bjorn Andersson 2017-06-26  494  					      sample, &ping_fops);
842891be96bd2b Bjorn Andersson 2017-06-26  495  	if (IS_ERR(sample->de_ping)) {
842891be96bd2b Bjorn Andersson 2017-06-26  496  		ret = PTR_ERR(sample->de_ping);
842891be96bd2b Bjorn Andersson 2017-06-26  497  		goto err_remove_de_data;
842891be96bd2b Bjorn Andersson 2017-06-26  498  	}
842891be96bd2b Bjorn Andersson 2017-06-26  499  
842891be96bd2b Bjorn Andersson 2017-06-26  500  	platform_set_drvdata(pdev, sample);
842891be96bd2b Bjorn Andersson 2017-06-26  501  
842891be96bd2b Bjorn Andersson 2017-06-26  502  	return 0;
842891be96bd2b Bjorn Andersson 2017-06-26  503  
842891be96bd2b Bjorn Andersson 2017-06-26  504  err_remove_de_data:
842891be96bd2b Bjorn Andersson 2017-06-26  505  	debugfs_remove(sample->de_data);
842891be96bd2b Bjorn Andersson 2017-06-26  506  err_remove_de_dir:
842891be96bd2b Bjorn Andersson 2017-06-26  507  	debugfs_remove(sample->de_dir);
842891be96bd2b Bjorn Andersson 2017-06-26  508  err_release_qmi_handle:
842891be96bd2b Bjorn Andersson 2017-06-26  509  	qmi_handle_release(&sample->qmi);
842891be96bd2b Bjorn Andersson 2017-06-26  510  
842891be96bd2b Bjorn Andersson 2017-06-26  511  	return ret;
842891be96bd2b Bjorn Andersson 2017-06-26  512  }
842891be96bd2b Bjorn Andersson 2017-06-26  513  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
