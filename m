Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280A624
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoIFbxBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699315363; x=1730851363;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=gp5r3p/XTnH6qbBi+PCSpiyOPORNXNSYNdbb/idgBt4=;
  b=VoIFbxBblZGELoyfJj5prtLPPB2519mjIWCosO5LU59oWoerJfWp/NvH
   +Ng31IyVpHCPKswCKgVMRFuAheDfviK119T4USpYo07/zk6/6L1I0bOcs
   NJJYmaC6pQ0bo1FHUzrjOijsMc13XtuAkD2oGqbCg8VTfSYZiFx6vjrLk
   4ugGwSVr6X+d8OPfutHbiRbv7r6Pt7bZDF2ZJJJhN+dl6nGq7g+Go1ha6
   VENaSrz51UiCOaV2oiBSIW3YN4koAj/lJR+qg2K8nxnbH8dBNVxlTKIYz
   GnbMvltOFFpiM95hbhvFOnqp4Fjkhx1IKTAGLULqIM9GDcmdhf5n3klom
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10937575"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10937575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 16:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="1009691221"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="1009691221"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2023 16:02:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r09YF-0006pX-0H;
	Tue, 07 Nov 2023 00:02:39 +0000
Date: Tue, 7 Nov 2023 08:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/4] drm/panel-edp: Avoid adding multiple preferred
 modes
Message-ID: <ZUl+fCE187+bU4E2@dccdf558eea4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107000023.2928195-5-hsinyi@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 4/4] drm/panel-edp: Avoid adding multiple preferred modes
Link: https://lore.kernel.org/stable/20231107000023.2928195-5-hsinyi%40chromium.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



