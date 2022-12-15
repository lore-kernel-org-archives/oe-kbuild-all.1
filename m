Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B1190
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Dec 2022 15:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671117943; x=1702653943;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Mm10yNQjw6ATCKOsPDc9QFmbTXGo7Chrw6B6Td78aOg=;
  b=C96aVDXybF/6Bzg6kl0YCj0rggUL9/d5kP0H6GS8TZGg9ejw0LQwVU91
   iJyvQw7/clf9vhRwwNXJuiZlGf8HwFmzwv115+SDAjPB7A5ybFBvTx6+q
   KhoXTR+62yuFoSWDe9Bsy2PhY4vTZQu9racBtpFhd2GFzveEKY4stPL4D
   ozLeAAPgF4FuYv5xz9oz1CuI9RA/Zw1lmzVCnalt+cpvkt1MveCYJYHyD
   bEyLkavD/i8ZPgJHXvj5xA3Y0DULAG6Tj9A+Vc73QHdylsABynetGw3Zk
   fbzEk02Uh3HfCqvIsBspROP4csV018JoVKaoCrELMDUs1EcsjVMBVZx9m
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="345789354"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="345789354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 07:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894824785"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="894824785"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2022 07:14:53 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5pwj-0006MY-0k;
	Thu, 15 Dec 2022 15:14:53 +0000
Date: Thu, 15 Dec 2022 23:14:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Hocko <mhocko@suse.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/mempolicy: do not duplicate policy if it is not
 applicable for set_mempolicy_home_node
Message-ID: <Y5s5zroPehFNAmTt@416bcb91c936>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5sz3Ax+tONdWgbN@dhcp22.suse.cz>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] mm/mempolicy: do not duplicate policy if it is not applicable for set_mempolicy_home_node
Link: https://lore.kernel.org/stable/Y5sz3Ax%2BtONdWgbN%40dhcp22.suse.cz

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



