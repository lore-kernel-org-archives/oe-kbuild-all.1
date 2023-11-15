Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12A97E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dXLcemkp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AF6u5ua002185;
	Wed, 15 Nov 2023 03:37:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=wA83epg46IZxAyewUV28Kirt+0qSsu7iAQen/Bkb5aY=; b=
	dXLcemkpsj1/UAK2CyrriXw6ZgBELDmsR9lGpAAMoccixZjRyqc1gnjO+XST9tGw
	mYEx8hjBz/dHDeYKtqflSo3nXORfeO0clhxvgQizGsVQVCJHLOu1I0NyFg3edovJ
	9xVGSasZVKOXqkAkUK2XAmSPYIQFZflXGNOykqvLD99EX6AO7qC7v61QkbAbNMll
	t5KJNinb2h4b86R3y3RJDlNzXm3NvNDBXVFo6b71RwXZFgWfGSEbAZu+R7mBF27r
	C6Zep1pWw2+dRoOBRgZqo7+M6edaaghDB6He5iHKta0Kshq+iVxjrlf0O+ZUThKE
	d/1BhiMzh47wxlpYdb88fg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpcfp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:37:43 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 09:37:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 15 Nov 2023 09:37:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 16FB915A1;
	Wed, 15 Nov 2023 09:37:42 +0000 (UTC)
Date: Wed, 15 Nov 2023 09:37:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting
 "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
Message-ID: <20231115093742.GA32655@ediswmail.ad.cirrus.com>
References: <202311071303.JJMAOjy4-lkp@intel.com>
 <CACRpkdb4d9pfstqDTZoBSqOSS4d4vLOUCnS6AKcMjLZ8TTQ2Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb4d9pfstqDTZoBSqOSS4d4vLOUCnS6AKcMjLZ8TTQ2Wg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ib5uJw7pb3N9TXitRPyqY-5-0thUbsl9
X-Proofpoint-ORIG-GUID: ib5uJw7pb3N9TXitRPyqY-5-0thUbsl9
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 14, 2023 at 02:40:38PM +0100, Linus Walleij wrote:
> On Tue, Nov 7, 2023 at 6:19 AM kernel test robot <lkp@intel.com> wrote:
> 
> > >> drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
> >       52 |         .name = NAME, .type = LN_PTYPE_GPIO, .reg = LOCHNAGAR##REV##_##REG, \
> >          |                                                     ^~~~~~~~~
> >    drivers/pinctrl/cirrus/pinctrl-lochnagar.c:67:9: note: in expansion of macro 'LN_PIN_GPIO'
> >       67 |         LN_PIN_GPIO(1, ID, NAME, REG, SHIFT, INVERT)
> >          |         ^~~~~~~~~~~
> 
> I looked a bit at this, can this be due to the fact that the macros use defines
> from include/dt-bindings/...* and that MIPS does not use these includes
> somehow, such as not using the same dtc compiler?
> 
> Rob, do you know the story of how MIPS interoperates with <dt-bindings/*>?
> 

Is that what is going on here? I though this was the long standing
problem that MIPS has some global define for RST so the macro that
string pastes that in, no longer pastes in the letters RST but some
value instead.

It has somewhat been on my radar to fix at some point, but I have
in general been a little unsure how to proceed. RST feels like
a mega over generic macro name to be exporting, so in some ways
feels like fixing that would be nice. On the other side, renaming
the register on the Lochnagar side would be very easy, although it
would mean the register naming no longer matches all the hardware
documentation which would be kinda lame.

Thanks,
Charles
