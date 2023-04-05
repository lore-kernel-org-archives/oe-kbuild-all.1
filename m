Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE3ECC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680695114; x=1712231114;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=HYktaKliGryaxGLKYhBAT0GfBTGVypPqih5kQf6VQdk=;
  b=DV1LwTfc0Ke0bVXb0gEGcNgZH9k6pwOMaBOShWL6oHIlJulO2nouQcr4
   irvr32lypnez/HABMWDLhP7c6koBfsPLGGRn+Yo0I/8J1BYOQz+bzOulL
   C58Je1aXMOuSUwyJ2GuK5GSsq3e75S4VKmvdOizZqCorualXZdFOSixGz
   dGcOwFs8AVMG1xqgbBkAZcs6EZP1PSECYnic1KDBTf/Q6C0n1rQnbpymA
   M5gE/CR2UGEU/qz3/T3npgD2gfLOkYnN1tkpTMt4OnVNAAyqz8nRAmPes
   HOAmrWKFWa7VJbcT9jJNK3TVALBcDJf4pc3YT3Xq6DTayZQ7m1rHwbNRO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="345009924"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="345009924"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680253498"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680253498"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 04:45:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk1Ze-000QVK-1L;
	Wed, 05 Apr 2023 11:45:10 +0000
Date: Wed, 5 Apr 2023 19:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in
 smb2_query_info_compound()
Message-ID: <ZC1fJiHvpbXcysXi@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405114220.108739-1-ptyadav@amazon.de>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.4] cifs/smb3: Fix NULL pointer dereference in smb2_query_info_compound()
Link: https://lore.kernel.org/stable/20230405114220.108739-1-ptyadav%40amazon.de

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



