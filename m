Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE81B8FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 09:14:27 +0000 (UTC)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1F1F41EC01A9;
	Thu, 11 May 2023 11:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683796465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=miqzCjL0l6Tfh12nUBO9HwcIx/H9WcQzzJBPnuuO4xg=;
	b=RuY3vK95A9jYFNhya7A2ZZuCvLQyq1SyedE47n0eBwl7xiLszqeOOR7LyXxAXZlaLQWHQo
	qdn5H0rq2GzMNKMZV60PhvjiUatCI/tvhArTipFPLRDtmUUcFb0bnhZkz8X0A/T63Cy+mM
	Z6XtmyENqRVXbjqLi4B54PvG4QJFrTU=
Date: Thu, 11 May 2023 11:14:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [bp:rc1-mtrr 2/16] ./usr/include/asm/mtrr.h:88:9: error: unknown
 type name 'bool'
Message-ID: <20230511091424.GBZFyx8D09hhgpg6SD@fat_crate.local>
References: <202305110003.WD5XnBVn-lkp@intel.com>
 <20230510191230.GEZFvsnsMTS/iIEZmV@fat_crate.local>
 <78877861-9995-467a-c36e-efdd05609e40@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78877861-9995-467a-c36e-efdd05609e40@suse.com>

On Thu, May 11, 2023 at 09:00:46AM +0200, Juergen Gross wrote:
> _I_ didn't miss anything.

No, you're responsible for enough other crap already. :-)

And I wasn't talking to you - you're on Cc. I'm giving feedback to the
0day folks so that they can make their bot reports a lot more useful.

> It was you who changed that to bool. :-)

Yes, because a variable used in boolean context should be bool, for
chrissakes. And that damn MTRR code needs to be made sane because it is
real nasty right now.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
