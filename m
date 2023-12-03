Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB222F44
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="cQJvwSMK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=91cBSBsaZuDf/yVzH7aZURJm0UvkLSdhHfheIQLFymQ=;
	t=1701630851; x=1702840451; b=cQJvwSMKWkS8otzZAzDbTyLyqRB6J9XX6P9pgQWuWgWyMHJ
	I+/C+GDPrJvsnXhW/rrCgKgEMnLLeqn8nAq1L6bP1MW3BoRw5Ej2Z8HbeRZwxvhV2ho3TzhtQT+v9
	kKUi83u+lFhcMwD3a7rQbPvqvOUn6Bn5dgZSWUCTcQFNdsLDlgPk1IznjNwjX9i0vMn1B9uF80p01
	DZYua3UhQuB3tgC4SqsVnjpCKUPYv7aYP2EDa1N4iFwB/1l4wFJgSk4z7p2LPllYOia0sE/zroKpD
	/633WIuEe7k4kGpJrbVg/1k6gtVT+/dR4JaGA5io0aPIJQz/+Wd45nFddI+zdYOA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r9ruj-0000000DmuV-3lV1;
	Sun, 03 Dec 2023 20:14:02 +0100
Message-ID: <f7965d3bd612ade8535407c06f99bfee77432bfe.camel@sipsolutions.net>
Subject: Re: [PATCH 6.1,6.6] wifi: cfg80211: fix CQM for non-range use
From: Johannes Berg <johannes@sipsolutions.net>
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Date: Sun, 03 Dec 2023 20:14:00 +0100
In-Reply-To: <ZWzS5yuKKYCVIxz9@520bc4c78bef>
References: <ZWzS5yuKKYCVIxz9@520bc4c78bef>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned


> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>=20
> The check is based on https://www.kernel.org/doc/html/latest/process/stab=
le-kernel-rules.html#option-3
>=20
> Rule: The upstream commit ID must be specified with a separate line above=
 the commit text.
> Subject: [PATCH 6.1,6.6] wifi: cfg80211: fix CQM for non-range use
> Link: https://lore.kernel.org/stable/20231203190842.25478-2-johannes%40si=
psolutions.net
>=20

OK, so I spelled it "Commit" and not "commit" ...?

johannes
