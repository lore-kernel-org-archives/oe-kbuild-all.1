Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E903735D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686159127; x=1717695127;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=EKLBh5452rTrtnSW4hcfYbaevBvLnjIuyMkRY6643bo=;
  b=FltIXdWXFN74/fFXabx0Xw3nwJCZXb8SpeQRnRpw8cUrPy00p+BO3UTn
   gI6IlChLCbxRzYoKJ0CHfn58R590697WcAstO6ItS95l+uCxCns/302iW
   wtiPjqOzwlCa9/8O1f014072Y96U3y/6CPg1EPs97dbPG9IaCsOGAqoOR
   DlZDfPRAD/nb0lKxRYqj05D8UquLm5/UYsSb66+X4kAMT5MX3EgnFq0UW
   aq+JRmFMTZgoAKMjcQMmma4Ss8BeZWaufMxRRqRL9+hyNMsJrrEte1gJA
   KfkU2cpF/eIVaOntc4Uvs6F3zy88FpyU+p39O6DJjit0DDBtO1YUWAolI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337417455"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="337417455"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 10:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709637597"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="709637597"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 10:32:04 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6x0t-0006m7-2n;
	Wed, 07 Jun 2023 17:32:03 +0000
Date: Thu, 8 Jun 2023 01:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fs: avoid empty option when generating legacy mount
 string
Message-ID: <ZIC+7BpKkZQIs6hT@a93e062a6cea>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607-fs-empty-option-v1-1-20c8dbf4671b@weissschuh.net>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] fs: avoid empty option when generating legacy mount string
Link: https://lore.kernel.org/stable/20230607-fs-empty-option-v1-1-20c8dbf4671b%40weissschuh.net

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



