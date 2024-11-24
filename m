Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D813774D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 23:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732491569; cv=none; b=EDv7YxpK7Um5zIKLfoZVsxE0C6QjmvqWzxI/rxWb3BhnqcGwOqzrSyUOh1ZjiBjeC/yWf1UmOtJWGSyEdhjoXHpyMVpmv9mYFoBT2Hl+4QxHCBBN3c3IFNnqRHpkON3op/7/Vm+bsMQ09xX4tQ3F4PR16q+D2yYk4EQAfFrYjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732491569; c=relaxed/simple;
	bh=o2EFBOpTJbYVmyQO9rUPhnk8Qq+RW3KWyYFq88AVD+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1zgPmfHy6JluSMirkC9Ld0I2hJMqlhGQ+tP0CECnJT3M8yfbUSyDnkVYSFas06cQta8PsbtGA+t9xFonJ87n194L4QTmJWoMwCAmJFnxImpj0/USladqnJGjhSYDMU7tZwEzg9NUsx7VlGkybktW2plWaMCw54G+d+s+Gw0GmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj/4lhMC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj/4lhMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732491568; x=1764027568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2EFBOpTJbYVmyQO9rUPhnk8Qq+RW3KWyYFq88AVD+k=;
  b=Oj/4lhMCVz7EKuNM/sczRY5BWZtdzBBtWSTIBg2zBKfqtzX/sSbdcFa8
   HAAfzmymelZ6+bwa5jFzjrM2qV70zU2BBIkiPYHZbdhTUtPCgNXQT+N2q
   NPY6VQcgqzpWKpwzK3ckfA7TCL9KWNL/koQpLxdVbgz8ByjVnBGBDtZ5F
   U+fPAoONR0mNXy1tHkQ6H9hqVeRfYPiQdlu/+r4fWMOfw3p/3yLzQ6mTJ
   3srm5h3VQIDfRqldFu+XCp1NhgiFTyZxpJyNifD9qXaFtWXustW79KECM
   j+uTaD4gIRogm9hJO+LuSZD5pE6i6vkeUPlSCDBlQBnJZSYTLcK4HM9yu
   g==;
X-CSE-ConnectionGUID: j040jrsuRmCS9YPo4xQPFw==
X-CSE-MsgGUID: o3My3N05T/K4P0HVw7rbOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20170995"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="20170995"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 15:39:27 -0800
X-CSE-ConnectionGUID: pnnIo6ptToOc63OKEfK9bQ==
X-CSE-MsgGUID: 8B46t3vkTdyNZ5oYZ81pQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="96159972"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2024 15:39:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFMCK-0005HQ-0O;
	Sun, 24 Nov 2024 23:39:24 +0000
Date: Mon, 25 Nov 2024 07:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:probes_ipc4_get_config 4/5]
 sound/soc/sof/sof-client-probes-ipc4.c:239: warning: Function parameter or
 struct member 'desc' not described in 'ipc4_probes_point_print'
Message-ID: <202411250749.Y7gE0165-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux probes_ipc4_get_config
head:   e0c8597ffe779df5d1fc4b1d1421948a486c6696
commit: 9b2093dccf471296e05debbeb54bcbb428c9bd8d [4/5] ASoC: SOF: ipc4: Make debugfs reading of "probe_points" more informative
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241125/202411250749.Y7gE0165-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250749.Y7gE0165-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250749.Y7gE0165-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/sof-client-probes-ipc4.c:239: warning: Function parameter or struct member 'desc' not described in 'ipc4_probes_point_print'


vim +239 sound/soc/sof/sof-client-probes-ipc4.c

   229	
   230	/**
   231	 * ipc4_probes_point_print - Human readable print of probe point descriptor
   232	 * @cdev:	SOF client device
   233	 * @buf:	Buffer to print to
   234	 * @size:	Available bytes in buffer
   235	 * @return:	Number of bytes printed or an error code (snprintf return value)
   236	 */
   237	static int ipc4_probes_point_print(struct sof_client_dev *cdev, char *buf, size_t size,
   238					   struct sof_probe_point_desc *desc)
 > 239	{
   240		struct device *dev = &cdev->auxdev.dev;
   241		struct snd_sof_widget *w;
   242		int ret;
   243	
   244		w = sof_client_ipc4_find_swidget_by_id(cdev, SOF_IPC4_MOD_ID_GET(desc->buffer_id),
   245						       SOF_IPC4_MOD_INSTANCE_GET(desc->buffer_id));
   246		if (!w) {
   247			dev_warn(dev, "matching widget to module_id %lu and instance_id %lu not found\n",
   248				 SOF_IPC4_MOD_ID_GET(desc->buffer_id),
   249				 SOF_IPC4_MOD_INSTANCE_GET(desc->buffer_id));
   250			ret = snprintf(buf, size,
   251				       "Id: %#010x  Purpose: %u  Node id: %#x\n",
   252					desc->buffer_id, desc->purpose, desc->stream_tag);
   253			return ret;
   254		}
   255	
   256		ret = snprintf(buf, size, "%u,%u,%u\t%s %s buf idx %lu %s\n",
   257			       desc->buffer_id, desc->purpose, desc->stream_tag, w->widget->name,
   258			       sof_probe_type_string(SOF_IPC4_PROBE_TYPE_GET(desc->buffer_id)),
   259			       SOF_IPC4_PROBE_IDX_GET(desc->buffer_id),
   260			       desc->stream_tag ? "(probed)" : "");
   261		return ret;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
