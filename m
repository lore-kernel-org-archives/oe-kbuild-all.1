Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0DD1BE229
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943980; cv=none; b=Qt0Y2R31JgOK+zRDW6AE/n9EcTNKmT8AQbvck4Q6HK8ac3FQ5z3kdwBFetO9P/U+ySgpGengWYhtXt00qf7N1abxGyX1Ub8GMM7Nb40sVYkn87D2qjbEGMr+38NndDQFuSi+sJjIBpMtGiJEuGKlZUwlUgEZuF+HHpyDgdr1nV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943980; c=relaxed/simple;
	bh=EcRtA1U8qgaYeFf87D2o2VR8P52XBfeQwJ39AxaXKkg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6aU/6yCGSrqhWY2kgtTBzam2boHgkV38+rZTtHzi5yKRENVyoZCwFpJoHgZWI7YK+IzSA962PKOftuZAvh6DHdlMRGP24nFVFTCsDuSZ0V7H6SufOnddXfX4t/UUQqsc1YX8QlE75U6IFwvvKKM6iKk0xfSUdrYxneotP6qliY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X61ZV+78; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X61ZV+78"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso4786371fa.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Aug 2024 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722943977; x=1723548777; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IVejJhSSwefbToNWC/vMSJDYdMIZMCdNUKTcNbMdxLc=;
        b=X61ZV+78gsGG5FigD1Fc6qIcSrZdcfUcxB9yHtQHZysH0U79jwLp+gQ7OyJCkVQ7Rx
         +l6Q71DaoIutWIyeT+rqmh1JGPeBvxH8asobuYJRmsRDdsqg9rPK30zpo9N9J2obhZRK
         6jKhc3pN1DMbsSHjKDuRF7nuNerK7GKPg9yenh804nUlwhml+qeSwjxE7Qrq4olZ6TzY
         l19Z+25IzV8gb86+AQeYMxJ8JEV1kQxWTDY4GVLARQkQCWqF5tlkcwRvdFtpzAhsUPye
         VAX33TPxQ7F4yyuNqn9PSun/jYi9Zo2kCReirUOd/NnbboAid2QvlU0ydxkTrLK5xouG
         9KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722943977; x=1723548777;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVejJhSSwefbToNWC/vMSJDYdMIZMCdNUKTcNbMdxLc=;
        b=cYjZOoog0oxe7r88HpwkyI15SWobiD42FkB59ELQJRkPcEBVT843u4H4MPBCHGe/fe
         Ku1YrbxVNVw0VO64L0kyvkBfDatdf4Qdx3GdLQfoDLQSgOp59JxSWp4C+2te4jSyd39H
         jf1XM3mOuo6UM8E+Os8JK6irA4AJHNs57BhVuKihbt+QRBJp/7x7baH5wFf4pm3fUQcc
         dsniyNhvR0XRTe6j5YFot+g7DRKOR+LNkXnCCPUYleltsqOj7nG+0wvMSqXEjb11gH9s
         UIIM4/21Wn6xpHZiVYqwxbju4LXU+zBxt6KdHjpWKJanYDKqgvcGiAH9GkBFudPRm9s4
         bRrA==
X-Forwarded-Encrypted: i=1; AJvYcCWpFTOpnvG87xsiU1Jr2occKe5Ri9xmaupnAxcpexYT6yxFZghFvLwKhDpq47taoVru1JuWcyEknWy0mNMLPISZcNluNLJ7ZD8WVc1MOg==
X-Gm-Message-State: AOJu0Ywml029yhHo1PSInXKjhp5DyU/xcNHbUgITTb040tcEiCxhkFkZ
	QMA/filKGpptHJGFNQAqRwzURtQf/mMvzG0836s6nJlzN5vtbo+v
X-Google-Smtp-Source: AGHT+IEIML1fcbxEmifD6CYWnibQGgfrmZhaChuLVp5niogHyeL8TR72e1QzDfH14JBGB+amQfws3Q==
X-Received: by 2002:a2e:8046:0:b0:2ee:7c12:7b36 with SMTP id 38308e7fff4ca-2f15aaacc1dmr104556941fa.19.1722943976887;
        Tue, 06 Aug 2024 04:32:56 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-6-196-30.retail.telecomitalia.it. [87.6.196.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282babaa2esm240389145e9.25.2024.08.06.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:32:56 -0700 (PDT)
Message-ID: <66b209e8.050a0220.1f20c8.5a92@mx.google.com>
X-Google-Original-Message-ID: <ZrIJ4y8S0sEtDOQ2@Ansuel-XPS.>
Date: Tue, 6 Aug 2024 13:32:51 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joern Engel <joern@lazybastard.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/6] mtd: parser: add support for Airoha parser
References: <20240804174414.18171-7-ansuelsmth@gmail.com>
 <202408050612.Ya1m6REu-lkp@intel.com>
 <66b0b109.050a0220.93681.d015@mx.google.com>
 <ZrHrn9NzeOhp+Sdl@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrHrn9NzeOhp+Sdl@rli9-mobl>

On Tue, Aug 06, 2024 at 05:23:43PM +0800, Philip Li wrote:
> On Mon, Aug 05, 2024 at 04:54:45AM +0200, Christian Marangi wrote:
> > On Mon, Aug 05, 2024 at 06:52:04AM +0800, kernel test robot wrote:
> > > Hi Christian,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on robh/for-next]
> > > [also build test ERROR on linus/master v6.11-rc1 next-20240802]
> > > [cannot apply to mtd/mtd/next mtd/mtd/fixes]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/dt-bindings-nvme-Document-nvme-card-compatible/20240805-014740
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > > patch link:    https://lore.kernel.org/r/20240804174414.18171-7-ansuelsmth%40gmail.com
> > > patch subject: [PATCH v2 6/6] mtd: parser: add support for Airoha parser
> > > config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240805/202408050612.Ya1m6REu-lkp@intel.com/config)
> > > compiler: xtensa-linux-gcc (GCC) 14.1.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050612.Ya1m6REu-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202408050612.Ya1m6REu-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    drivers/mtd/parsers/ofpart_airoha.c: In function 'airoha_partitions_post_parse':
> > >    drivers/mtd/parsers/ofpart_airoha.c:33:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
> > >       33 |         prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > >          |                ^~~~~~~
> > > >> drivers/mtd/parsers/ofpart_airoha.c:33:14: error: assignment to 'struct property *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> > >       33 |         prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > >          |              ^
> > > 
> > > 
> > > vim +33 drivers/mtd/parsers/ofpart_airoha.c
> > > 
> > >     10	
> > >     11	int airoha_partitions_post_parse(struct mtd_info *mtd,
> > >     12					 struct mtd_partition *parts,
> > >     13					 int nr_parts)
> > >     14	{
> > >     15		struct mtd_partition *part;
> > >     16		int len, a_cells, s_cells;
> > >     17		struct device_node *pp;
> > >     18		struct property *prop;
> > >     19		const __be32 *reg;
> > >     20		__be32 *new_reg;
> > >     21	
> > >     22		part = &parts[nr_parts - 1];
> > >     23		pp = part->of_node;
> > >     24	
> > >     25		/* Skip if ART partition have a valid offset instead of a dynamic one */
> > >     26		if (!of_device_is_compatible(pp, "airoha,dynamic-art"))
> > >     27			return 0;
> > >     28	
> > >     29		/* ART partition is set at the end of flash - size */
> > >     30		part->offset = mtd->size - part->size;
> > >     31	
> > >     32		/* Update the offset with the new calculate value in DT */
> > >   > 33		prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
> > Mhhh somehow I can't repro this with instructions?
> 
> Hi Ansuel, would you mind sharing the steps of reproduce? I can reproduce this with steps
> described in the repro link [1]
> 
> [1] https://download.01.org/0day-ci/archive/20240805/202408050612.Ya1m6REu-lkp@intel.com/reproduce
>

Hi, thanks for confirming that. Manage to repro, just had dirty
build-dir and config wasn't correctly applying.

-- 
	Ansuel
