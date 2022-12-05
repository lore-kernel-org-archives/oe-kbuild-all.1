Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2EB7C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Dec 2022 13:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670246993; x=1701782993;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tYLhhn4pAQ6YWEivABYcF9aSMn3UnEaXEeCLPnJZ+VY=;
  b=kFop/QNbXV8uwvwBro4C7D4giAaWxji6tWdeyKlYNmnevKc0AngqLqps
   o51THGlbns1ZrX906a0QSp28k+0rW1hWr3emh7ZUasDzQ/6YdbUpY3fM8
   WcwgslOG2ncVA1Si6EOI1E0/backByptdBMJpj/VmtNAwkQJCbAZLKq5E
   aq1PkegoDsqTZl+cd0qKU/no7zDkmPTABh9fhy2hXn9Say77p0gWgj5pB
   mtey+3yrA/I/sejV4+Fgtz17Rw+4bk1xzsFyZEmQB0u5IQ+gPt5GpIBlA
   OCrgtRqUNO/KhpgnV/rUQMyQZxTW14w2Ewny1/FBK8U6ot2dWNbUGTjfZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="296041234"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="296041234"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 05:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="647940809"
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="647940809"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 05:29:51 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2BXb-00008K-0X;
	Mon, 05 Dec 2022 13:29:51 +0000
Date: Mon, 5 Dec 2022 21:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10.y stable v2] block: unhash blkdev part inode when
 the part is deleted
Message-ID: <Y43yMYuLMXq4EQMO@0d7994225921>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205132739.844399-1-ming.lei@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.10.y stable v2] block: unhash blkdev part inode when the part is deleted
Link: https://lore.kernel.org/stable/20221205132739.844399-1-ming.lei%40redhat.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



