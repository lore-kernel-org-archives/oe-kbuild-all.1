Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7FBD51A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685391823; x=1716927823;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=dHzj77M5iW9y0SdEwCAhxo0nw0XBCCxdmbhnS7voNQA=;
  b=Wy7a36yKi2zrKJ/0HZlOe8sjERSlLmyjAPDTzktRpEepM29iPbPEQ+3r
   tijAoHQW3ZhwdytVif+AnnHGWr90/PwhS38oa1LYSyAZdXBUadlfp8c9B
   NbEsn3JiWLDTuagn4yyzvfrjnpWWw1NNDZ80uQN8SsO/QgivX90/1Hw0K
   vvQoyPncgqJlDa54++SjeZHycbYYW9HuTxyCX5IBS1Dxf6+34c5iELf4R
   CZs+nAa/PWYMjXbonJ/qscSX5Sqn0MgDIvHwJ86mcnW90m6/Du4RLTY/D
   IURFWpKFAV6i5ecEZxUZRJC3VF4f+Z1egse8YONQgdPPNNxPH8DIPmqMW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441122071"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="441122071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 13:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683678943"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683678943"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 13:23:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3jP3-000L7W-0I;
	Mon, 29 May 2023 20:23:41 +0000
Date: Tue, 30 May 2023 04:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/5] scsi: core: Rework scsi_host_block()
Message-ID: <ZHUJp6bPf8+Yyf94@b4b7677a4534>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529202157.11361-3-bvanassche@acm.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v4 1/5] scsi: core: Rework scsi_host_block()
Link: https://lore.kernel.org/stable/20230529202157.11361-3-bvanassche%40acm.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



