Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1562940B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jan 2024 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7cLQzzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704789831; x=1736325831;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=dV8vYUc6qCpiMw/Q1ZnYoEhB7LoaZk97Be50UlRi7WY=;
  b=S7cLQzzO311ghAduBPgZTM4rf4vSSbM1l4bjn2XmvT5uB636rImbtrDB
   Oy9PLkO7UaJNDdEiEhV+bctdATcq/BKX3Yx/CMl4QOe3aPP8njTqn4IUi
   t4Fx3RCCRh8dl6Unp1RNbdhrkI1hc0k7M9LEgpq4aXy70U/lqrzEj1X/J
   M56f8HqH7QGy69j6naJJ2CiiXl58r9uGg9Rt8ULMbuI/n+D9Vfott6xSQ
   QRCl3zVr1+qMU2ZbT/Zjiqd3MwxfzXqYpfhz/deTpPKqH8wBvcRlthdWS
   KHoD8OehUtIVhqiQQ1EOXBtCgcn1HB+figBYn99HSAqxh8+aymoorS4f1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="401920273"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="401920273"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 00:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="785154191"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="785154191"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 09 Jan 2024 00:43:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN7i7-0005co-1B;
	Tue, 09 Jan 2024 08:43:47 +0000
Date: Tue, 9 Jan 2024 16:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/1] Bluetooth: hci_event: Fix wakeup BD_ADDR are
 wrongly recorded
Message-ID: <ZZ0HLM87z9nQyFJ7@c3f7b2283334>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1704789450-17754-1-git-send-email-quic_zijuhu@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1 1/1] Bluetooth: hci_event: Fix wakeup BD_ADDR are wrongly recorded
Link: https://lore.kernel.org/stable/1704789450-17754-1-git-send-email-quic_zijuhu%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



