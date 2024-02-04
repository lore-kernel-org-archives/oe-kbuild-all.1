Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C1EDE;
	Sun,  4 Feb 2024 01:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707010012; cv=none; b=KvMknVDFPBtTVDQQKuLKMLip7cFGdoC8vLY3j6TTybTyEpDZPLKuapbWUZFjxRzCDqwGAjPZGHSL7Fvidjmm3AcUStoc24fK21gRoUp7+7oeE4ypNiLDDlpot93K8kzE8+vAQZ6Ys7j0QmA1ipr+K5f8khNeLTocDvUUaShRmJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707010012; c=relaxed/simple;
	bh=LpJEAMF+Ooaz45GJ+ISwigXoS0uW4CmyzR45FwrvGHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvErLk/pVbjsfdfEMFxO8lF54PceGiGAQwB5Jsq5d+xgSkYosn3SGIAJUyAZmqcVkIy5j3f7sUdeLKg4I2QYs/CxDDussmkL6AXzRJ/Jn+4ZrfPzavM37sNxdXVvyR43MCUsif/HsYOIIJ3XNy08SgLZsmp9/ze4fXF7dwFXn3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nLKCxn+y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nLKCxn+y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rhinI2Yz3ldCYiyf5UXL/+9A9v7fUw89mwEEs5eTdoA=; b=nLKCxn+yVc/eV71DOyVta0bKBT
	FUeGTTTOu39hERGUbyGAbzcy4KEO5G6/e2Kr1ayYOEoNbIj5uBM2Yd7XTYD80FwZoKU1RZ2sv4J0e
	5Mh0gM9wsHCW9gEetfCoSlFmFhC7FFMIP3lksbh0cLHSK4VKGYLQ43/GtAsm4NcAMHrT71mQESHol
	3c8AUCqebHKxmdNzCOysrVed7qUl98AF/bfAuT3lcgowN5qJ/GcA5LgWuZ/6wGyOjT4LDGU6Agk/H
	8lpVauyf5NFHSEoumHx6ARu5ib7KPI0On5PtrRKVbbm2Y7+RCqe93mZ9g1e5w4sq3XcFbRQLvqeTg
	pSFnGWPQ==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWRHV-0000000HWAS-2ntk;
	Sun, 04 Feb 2024 01:26:49 +0000
Message-ID: <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
Date: Sat, 3 Feb 2024 17:26:49 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, linux-doc@vger.kernel.org
References: <202401070202.BQvPxgyp-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202401070202.BQvPxgyp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi ktr,

Sorry for the late reply.


On 1/6/24 10:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
> 

but what was the warning or problem here?
I don't see it.

thanks.
-- 
#Randy
