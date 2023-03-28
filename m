Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99352772D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680039744; x=1711575744;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=eO8IqPBPoLCogARfWNubQrMSOqpaultzyNjehZgMcuo=;
  b=gD3HXu7Ptsog0bQX9b9eqD2u64nZIwaNtRoZpJR+F/HIdgAvRv/Mh8wW
   LHHsx0JMX+Rsg7UDk3hE3qxh/hfAtvK4JzZjqRAj58K86SWoSLwrX0SNK
   8H94CzKy7csVNAhpAxy/YWx+I00PBKoWIfjyiFeEnC51Xi0IzVevWVwFs
   LxP6BKTM5AyjkRdy5iCa/KWipWF49qKLQPy4rw9MByE6wjLH+nPM9WYz3
   mm1ioWb/FRdbw+wtYm3nfOyBTyBTXFA/g4F09xKuipybiBPB7TXbw2lgD
   S3lNXnfeJ12UcmiPI5hLK01f4V8xDoIXyZtnt4OFbrGLkylizbO6wFRCV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="426973025"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="426973025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 14:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="634214642"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="634214642"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Mar 2023 14:42:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phH5C-000Iut-0G;
	Tue, 28 Mar 2023 21:42:22 +0000
Date: Wed, 29 Mar 2023 05:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sagar Biradar <sagar.biradar@microchip.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] aacraid: reply queue mapping to CPUs based of IRQ
 affinity
Message-ID: <ZCNfEtmZXd9QTuZ/@0f0c699f4fc0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328214124.26419-1-sagar.biradar@microchip.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] aacraid: reply queue mapping to CPUs based of IRQ affinity
Link: https://lore.kernel.org/stable/20230328214124.26419-1-sagar.biradar%40microchip.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



