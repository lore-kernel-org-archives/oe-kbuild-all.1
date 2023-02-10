Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0567A63AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 17:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676051804; x=1707587804;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=oDIoxmB1lXhyFQ8ndOeiDuORyfzib2k06uLgAX8FadQ=;
  b=EicpU7thY6Gkzh5nZpcHaBw2vvabtndt14Brl9XSD8oYSxci9M8KDb2t
   eTkGJ/A57/ziymLEAvXYP6kxgkoYCvSP6UfS0ODQW5qKhHiOfjHSxs7oY
   mW1K/Jw6vH48Dk4k5hunV46DzYXfETJksE1JIfxVpo1QtQKbwlZFlTGcG
   P5qaz8KQPlCsEQ9z8lL8oA5Wlp12NySH6sQFRoFPnMNJVmY2WP+FyjMga
   8l4tlAdAXessKdrPRxw5fjIxi7Utuqatv7M6HF94+R4pGg906VwMOUZZC
   A37SgNRiGUP9Erec3gDHuEdpNnyAMKzXvD3BPX8b7LQFftRtMxVWZYm1/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328175084"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="328175084"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 09:56:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="777016033"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="777016033"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2023 09:56:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQXdZ-0005xF-2S;
	Fri, 10 Feb 2023 17:56:41 +0000
Date: Sat, 11 Feb 2023 01:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] scsi: target: core: Added a blank line after
 target_remove_from_tmr_list()
Message-ID: <Y+aFVRXuSX+/3HHX@a5b9dd7d9a79>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210175521.1469826-1-alok.a.tiwari@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] scsi: target: core: Added a blank line after target_remove_from_tmr_list()
Link: https://lore.kernel.org/stable/20230210175521.1469826-1-alok.a.tiwari%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



