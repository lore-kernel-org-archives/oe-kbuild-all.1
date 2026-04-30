Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08B39B48F;
	Thu, 30 Apr 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547423; cv=none; b=nnup3e18FuE2yWTOnS++5IdAumcUHyJmaNhlh90iwLqu45SvDh5W1YPDWw2KgcG+jxQhRWfSjdmUkA07hxcRhJXyx488lJXJebPzcaDCZCPvTLb8K1UGWXmSkh4tEl9QpW/NsdBskGhyXX08w+J/uk4qr87lr+TscuK+fenA3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547423; c=relaxed/simple;
	bh=M+gVySjyJbUTSLW/MNoSWcg/GGChfg99AOPdIoCSR9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmeADok3kChT0bMclh7mO/S2rb4pJ5VxzkmyS+eGL/g3JtuaDjni0i4pi+Atx804NIth3aVMZemgsojox7K7l5ukZ0uajzZuL1gtYiD2qJ0Mgduxe1HQhBVkjH7Y7slKKiZkPEfGkhfGUJzevoY524JUtdoPZ6sIm3CRLuefACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qNOEjUkI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qNOEjUkI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BEEC2BCB4;
	Thu, 30 Apr 2026 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547422;
	bh=M+gVySjyJbUTSLW/MNoSWcg/GGChfg99AOPdIoCSR9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNOEjUkI+b2dSq/zNcgw/LPZTq/C6GqykdakQ2VHSXtyRyWE1qOVeH5J8ZHnwMq9s
	 L82W0eJscbpJfC/3z/1ahV4nrWeTCaqsIUYvh0z48pFGPL8awFGPRDbVWcPhFb8zXo
	 s4vY2PC5mPOgphXJ6b7Y/WpO42l0NzHv0/IjucQHykF5kWHhxuVoQkdEQUfeIPt5EZ
	 0WJjyfZWjGuwLR3NQ6ixamvdfr5ulJs0+sluNua1p22YSuJhAXD4mvFJMWMRyM/oV8
	 O2YhJrnNorBkDE5luavHIfBi7WDUGkCtxkmjjHR/iub5mqV+3vvMlxXrDq1aKrh0E/
	 E8dVYygRA2K6A==
Date: Thu, 30 Apr 2026 12:10:15 +0100
From: Keith Busch <kbusch@kernel.org>
To: =?utf-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
Cc: kernel test robot <lkp@intel.com>, "hch@lst.de" <hch@lst.de>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?7J207J2A7IiY?= <euns212.lee@samsung.com>,
	=?utf-8?B?7Lm47LCs?= <joshi.k@samsung.com>
Subject: Re: [PATCH v6] nvme: Skip trace complete_rq on host path error
Message-ID: <afM4lwLRimijbmS8@kbusch-mbp>
References: <202604300750.YpUGtmek-lkp@intel.com>
 <20260416010713epcms2p78575bd400f93f6edb7fe3f3ead5bf930@epcms2p7>
 <CGME20260430051839epcas2p20fce5951dc4a04138033e5943f1acdbf@epcms2p8>
 <20260430053401epcms2p88c3cac0c3b817015d718cc0f4914532b@epcms2p8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430053401epcms2p88c3cac0c3b817015d718cc0f4914532b@epcms2p8>

On Thu, Apr 30, 2026 at 02:34:01PM +0900, 전민식 wrote:
> Are you planning to apply your local fix directly?

It's already committed to the block tree and should land upstream this
week.
