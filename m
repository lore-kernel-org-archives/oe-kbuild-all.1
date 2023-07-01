Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE27323AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 10:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688207651; x=1719743651;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rDlCz1aRhlklJkVRNL51fuaHPFb1rfjbcDtn3SwGVFY=;
  b=akYWKGMyEDUzY69hakYfYVPXynuU9L6FTKjzAwNrSP+uQopOu1HVEuiM
   2otRa5dlAZPF4xgvdlMFzw8bqUxDJDeNaxgb3Do88N15c+Mn5w93sJ9DQ
   p6SvnBIIwdaLqOqFmjDyO9X2MQOsztDYooQmu3PBxy/zJqwJTcsRT+kAa
   /+gQjaMPCrUYvTOMWWvWb/yhxZSW7ZRtY69Y7JHUcAwDRp6mLm5zuGOgO
   cTmJl0PN0Ma0zPc0lXHgdMS5uQTcoQhP+9cPxfLSWjiB+03W6kzsHO+VP
   gAjaHPkYPx8gQIb9DoLIszgJ2D5O29CPMp+hM/298eSYdpOXT4Mvwux3l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="362622120"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="362622120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 03:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862560177"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="862560177"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2023 03:34:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFXvc-000Fy9-2Y;
	Sat, 01 Jul 2023 10:34:08 +0000
Date: Sat, 1 Jul 2023 18:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] xtensa: fix lock_mm_and_find_vma in case VMA not found
Message-ID: <ZKABDJ/qASOzMGRI@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230701103155.1209274-1-jcmvbkbc@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] xtensa: fix lock_mm_and_find_vma in case VMA not found
Link: https://lore.kernel.org/stable/20230701103155.1209274-1-jcmvbkbc%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



