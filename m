Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F867E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722233086; cv=none; b=jzAHIE9/QCxcG0Pe+5LIMMxDevIXjZNupj/uIBDj5GiblfmDA+FjrFQoLEDxHvGAv7rdEYPFXBmXit9SBd9zcGaiu+dQRHorrNZ+YkTNe5TssxJdC7HGFV+0B5WjFkjXV3ffUFJPsMh1o+DtuJG9asu2PmGuFX5hBTWlBwJSQvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722233086; c=relaxed/simple;
	bh=0cwYqlyMDPB8VgPZ/zwuo9n/Po4y2A488FMRrha7fC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fyEZgAO9wZKRIadqCjZN5gTgJjRr+8vGV/GUysc0fHWjr2bZgC8+eA2TztuXJAymJUb019S8VLyA3FfDsozONL0r/0a1SljRczW2zNRZy2M2gn+AdOP6TfH98/AnUTW0AEGC7nSRV8xApG8HeD6xPkNXQ+8zKq0m0umu4j+/AAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNDV0jbW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNDV0jbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722233083; x=1753769083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0cwYqlyMDPB8VgPZ/zwuo9n/Po4y2A488FMRrha7fC0=;
  b=GNDV0jbWCGqJOpK9BeY4AW1OlXOuyMOMuZo3nE7BYCljEeMfq5d9NfS8
   UEHmDjdoHa4bCr4yWq7mBp4UhpfQvI5j1p5+CzuYJi1zi8Q0v+f8w2ekr
   jdwrefr6eYx06l3U/s2UYmvyML/t51y4pWVKSHuW+RkTnhxKv3vtNhXmJ
   bqtRGKrQw8klDnJOl4KEpNZuk8NasbUe2J3jwIl8/+in1LNDGWV8XdO5v
   sgUN6DgP9gDFeMEoyfllt/guWs8uYdS53Mxf8wpGE1dkR2mBZJNF5fz+c
   BAy0VZf4PSXF6HUPbpCEmpm3LWcoSKhOLntO47VrOJx8di46BF4g8tT/U
   g==;
X-CSE-ConnectionGUID: 7IS0rqAGR3mumRMveKXd7Q==
X-CSE-MsgGUID: nejn8yIJTSWFkIgjX9k2sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="20092317"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="20092317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 23:04:38 -0700
X-CSE-ConnectionGUID: qVhCJKZbSga+rHt7yT4fXg==
X-CSE-MsgGUID: cAQwPl/QT7OLDjlt+w6W+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="53553734"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2024 23:04:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYJUn-000rU4-0B;
	Mon, 29 Jul 2024 06:04:33 +0000
Date: Mon, 29 Jul 2024 14:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5503/7897] error: couldn't read
 tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs: No such file or
 directory (os error 2)
Message-ID: <202407291345.89gFFK2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   8827461ac92e93f2c805b31a00cd444f7b59f41e
commit: 6bacfda06c7bc4a51d082ec01f02384789695a40 [5503/7897] rue/scx/sched_ext: Add scx_rusty, a rust userspace hybrid scheduler
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240729/202407291345.89gFFK2b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407291345.89gFFK2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407291345.89gFFK2b-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
   Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
   Warning: can't set `version = Two`, unstable features are only available in nightly channel.
   Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
   Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
   Warning: can't set `version = Two`, unstable features are only available in nightly channel.
>> error: couldn't read tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs: No such file or directory (os error 2)
   --> tools/sched_ext/scx_rusty/src/main.rs:6:1
   |
   6 | mod rusty;
   | ^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
