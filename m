Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEAA8F59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 03:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694487734; x=1726023734;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=b+7vQ3gcDrvCYXFKtOaJZHg6kU6GvLosAhUKznK801o=;
  b=GrsVNTyuoDPc21DgPc35ZQQ3QV/2e7sj1zebb2l0LRh+w1ht9nyekXjP
   WPM1C+Hn/NJ5ZKmAPDIWFsECwK3FdqwdtrqNrxW6AK2CLPjeZg8O1jd2k
   GyUXb9+RetXEwdQjlPBgJ13eZlXS07IPf4Ltl81p9Ddvgp/+eRElLZfTK
   gnOM/ITh2D7PPfSUNhSj4sQ5eFXZ/yJtFmYOfmHSt8IUdOcUpMd4kdMA3
   YOlSYMM33E/bQZCswD1xX3OGfRhdluPc7xQrCStfS/SahqQPCB3rKpnmR
   U13VW+jMwVdtVPpuJkGL15MKqOPog6mV5hCx5ipeUDQsPCv3Y9IdiTYrj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382075844"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="382075844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 20:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858606801"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="858606801"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 20:02:11 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qftfF-0007Ba-1H;
	Tue, 12 Sep 2023 03:02:09 +0000
Date: Tue, 12 Sep 2023 11:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/4] vduse: Add function to get/free the pages for
 reconnection
Message-ID: <ZP/Ugy0vLvmomlWG@0091dd92274c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912030008.3599514-2-lulu@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [RFC v2 1/4] vduse: Add function to get/free the pages for reconnection
Link: https://lore.kernel.org/stable/20230912030008.3599514-2-lulu%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



