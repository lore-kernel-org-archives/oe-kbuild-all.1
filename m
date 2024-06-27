Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8312A16C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478806; cv=none; b=WAGH8shw+NvlodK9+IfMp/oJV996TM5nn7lCodXloi5thcr5UCX94tAoqmzBJWXAmLlpWXQwqEZsIU+Q5bL1eoQHNtvoahshb0QY3px6x6jd4CzJ3balDBgB49Tyd753dN3mzXxb5cqLrkfXUtS1EOGY4btP2UbaBhiOp3b7G5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478806; c=relaxed/simple;
	bh=H7b2LY83lSDab8qeVyeKHWzEL0OH3OgUya/F1ucVntw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZAFu1ep+TQuvfZUHqseq9sfjc521MjeI3PGbizPXMULSk9gDknDXdzul8MBSub9zLW0x/D226LDjCcpV786NhTXQNgJp6jDpPZcKkAUINFO4bejj7b6FIgJ88aKt7gChRgguNP8XeNHso7shZUoM8ykzfgbiNKHDF7NcC+ajfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjNvMSjr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjNvMSjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719478804; x=1751014804;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=H7b2LY83lSDab8qeVyeKHWzEL0OH3OgUya/F1ucVntw=;
  b=AjNvMSjrLUe0M5IGsFq0MltFlI43rfzeGrTtEQoVMaztxuzgJKl2GvKD
   ygVWj69gfOfiP5e9QB/4CchJFCSCxiKdusUN0ONCCoW2y8+Dow2if+mA2
   edtZPG8Oyz8mEvootavYTJdhFZJQILX//Cuqg183lsnRMTJHraxJA5rwk
   E3x9D5Y/yYNIvSwngTKBst/l+b9at2IH0B1G/5OjIskI3f+DhT4ahun0s
   DkUq+mCyo6ETvuaPUlFRr/mzu8SCZl3UeFjXPbflChue6XxkkSBmRxtjV
   +kLdtevrBuuMqPSEWw+n72jjGT95WAnnsQYUg3ACjagMXaxcX9QRqj6zm
   A==;
X-CSE-ConnectionGUID: 6ll2rT7XToSN5MIP70OBAQ==
X-CSE-MsgGUID: k9bYRlkTTLKE8D7jvrVxuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="12276846"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="12276846"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 02:00:04 -0700
X-CSE-ConnectionGUID: 3IDMqEq+R4C0+gRatTrCWw==
X-CSE-MsgGUID: 1B6WLMgGRbal5DfiHaN4Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45052961"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 02:00:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMkz2-000G4o-1M;
	Thu, 27 Jun 2024 09:00:00 +0000
Date: Thu, 27 Jun 2024 16:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Ukhin <mish.uxin2012@yandex.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5.10/5.15] ata: libata-scsi: check cdb length for
 VARIABLE_LENGTH_CMD commands
Message-ID: <Zn0p23YAY5Pojyvi@7e8ef4ebee7b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626211358.148625-1-mish.uxin2012@yandex.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH v4 5.10/5.15] ata: libata-scsi: check cdb length for VARIABLE_LENGTH_CMD commands
Link: https://lore.kernel.org/stable/20240626211358.148625-1-mish.uxin2012%40yandex.ru

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



