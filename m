Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E633DDDB5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746060; cv=none; b=dXv29W1U6Bl7Jh8Y0FEN0IpFpvPBXHfVO9eIbw+QQqbq0zLP/WzyloIDJLx7Fho+sPSSwCZi6NApK9KVS5+vMTQgD1AgINx4OsssIlsmpDypxlaWzjqdkcvRPJ18pqE/4SIyUfW5VTPJ+NFxbI0wJmh4/d7EpoUxpytNeujTb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746060; c=relaxed/simple;
	bh=7/F3kqTszCmE4ucnm9oMkBNNJRuTH/JUr9yX9oCAU5s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H0ZjYkRPP0ZQLxJTlHb/My6Qil3yBND3WTY7M70uJJtcF3a8SDk33kqmekM66KisNVKAf+63CtLVdZklwCQmyfm3lrv30evEbDyneXFBo5Lj//xZyxf10SlS0imlaAzqkM5PjIkUFRCSquEMTD3s0ETv2pEkQN8fJ/7DqrSJzo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 9774F592E0;
	Thu,  9 Apr 2026 14:47:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 6EA746000A;
	Thu,  9 Apr 2026 14:47:26 +0000 (UTC)
Message-ID: <1c7e8c605d2373c26b08d0eb64cc56efd69dbc26.camel@perches.com>
Subject: Re: [linux-next:master 8662/12838] htmldocs: MAINTAINERS:40:
 WARNING: Inline strong start-string without end-string. [docutils]
From: Joe Perches <joe@perches.com>
To: Matteo Croce <technoboy85@gmail.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton
 <akpm@linux-foundation.org>,  Linux Memory Management List	
 <linux-mm@kvack.org>
Date: Thu, 09 Apr 2026 07:47:25 -0700
In-Reply-To: <CAFnufp29D4VdTgoJ4uDk-dQ4-RuO_C6=TQ7O9TA5M=JSe1j+cw@mail.gmail.com>
References: <202604090741.1kUVXMoc-lkp@intel.com>
	 <CAFnufp29D4VdTgoJ4uDk-dQ4-RuO_C6=TQ7O9TA5M=JSe1j+cw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6EA746000A
X-Rspamd-Server: rspamout06
X-Stat-Signature: 5dbebmi6d33bdepkadcfsbnrtcqkeh4z
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18uJVuv+UXJvy6vOUymKWsgA5Mo2qrk7Bo=
X-HE-Tag: 1775746046-745085
X-HE-Meta: U2FsdGVkX18/i7UnpokYUBXsVUJRz7TSfKAldsJT9+3BICcpfdufH+GXzgkqHIDoQFes94tQKR/rxN95CWP+39VdRWdnG8Z5PqHGmUOm/PoPvMAGqA6yPVra6/qw2y5onWJgFx1d2I0XalNIqKWs76EyntueIFJYL44o4omv2NSAr72wA5F2iMaszmSYzejqIhixC6BYvCarLTOXgSr1zE+mRuh3aCaQMQkxcWt1m/Q68is1QH+DBl0Di6aRSvTvLJjnQViZv4uzSBeGyAv+Asor8gbl1mPQQwtXt3HTLfpOgX1ss2qha5w9NxnRVc5w

On Thu, 2026-04-09 at 12:12 +0200, Matteo Croce wrote:
> > > > MAINTAINERS:40: WARNING: Inline strong start-string without end-str=
ing. [docutils]
>=20
> >=20
> >    Documentation/userspace-api/landlock:480: ./security/landlock/errata=
/abi-4.h:5: ERROR: Unexpected section title.
> >=20
> >=20
>=20
>=20
> The problem is that "**" is seen as start of a bold text in RST.
> Escaping the first * fixes error and keeps the glob unaffected:
>=20
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -35,7 +35,7 @@ Descriptions of section entries and preferred order
>      F: drivers/net/ all files in and below drivers/net
>      F: drivers/net/* all files in drivers/net, but not below
>      F: */net/* all files in "any top level directory"/net
> -    F: fs/**/*foo*.c all *foo*.c files in any subdirectory of fs
> +    F: fs/\**/*foo*.c all *foo*.c files in any subdirectory of fs
>      One pattern per line.  Multiple F: lines acceptable.
>   X: *Excluded* files and directories that are NOT maintained, same
>      rules as F:. Files exclusions are tested before file matches.
>=20
> should I create a fix patch or we can still amend the previous in net-nex=
t?

nack.

this shouldn't be fixed this way.
betterwould be to not try to format things that shouldn't be formatted.
