Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146563C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Nov 2022 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669823423; x=1701359423;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tYCqXHoxTqAW3+ErSFVgjAvQtVZdMlNSTEVMTPqasN4=;
  b=MTI7uAtKNN0c5treA6XszIOqa9yQQzIYQEwOMKnkEIOx1Nvq234xI7i4
   9D08ygCh2wtiFgQnHHhY54xd85fmAB6BRenq1aQsD+9aNyw+DYfcWtNrk
   b6+VvVrCqKV8lYtauBYwhoHz2DzIK32+i9ale1DHUhNsO1aVFjuOwaVBf
   qNLGlo+PiwrfvearGXdPVWel5B+SbUia2xNiko0ayf98mse6TNuO7ASCJ
   hjUQKe4fapuPqRD4+1wxHegLAB7FsRTdd/pCym5TQW0HA80G71iBiDJf3
   CJgn9sqYvFrnHOdO6ffwNJLyN91LfZV5kfr8t8fuVERNhpZtihCtPYMsR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="298798613"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="298798613"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 07:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="889334340"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="889334340"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2022 07:50:21 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0PLp-000BMd-0V;
	Wed, 30 Nov 2022 15:50:21 +0000
Date: Wed, 30 Nov 2022 23:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 1/2] kexec: Introduce kexec_with_frozen_processes
Message-ID: <Y4d7jhvvJKFCMO/P@0d7994225921>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127-snd-freeze-v6-1-3e90553f64a5@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v6 1/2] kexec: Introduce kexec_with_frozen_processes
Link: https://lore.kernel.org/stable/20221127-snd-freeze-v6-1-3e90553f64a5%40chromium.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



