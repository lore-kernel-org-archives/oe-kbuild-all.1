Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729983D3336
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751803; cv=none; b=QDrMVUO2RQrVeU/NAxfnWeNpoq/VPg0ozcsoIp5YN3ny2+iDgFKhYgKb6lVqpckqivWBOK+qb6SHlx5QTCYvuVTTIruPtCn/YAIFyYvKQJz1A4dEDYVgYlMzEx7k1kooyXVzAJETQshbyPpzAWDFsXmVNd7gEgw2H6t2Si9UUac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751803; c=relaxed/simple;
	bh=enMlPddTIsfJN3ebbTLTvc1vKeEHn7OXD4OEQxPtAbM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nTcf8yU6qntSCnMK82/hjJD5BVqL7CU2DHH+I9wLdfw2gmqC3H0ItdP98V9gB+cmtcBfHuR20o8+zfTIZrQ/Wigd6uEiCWgqZZou/YzD643KwZ3wisKKyVNgssDOnJ9uCqX7/RjQ0l1e7TfDdqOgWyFyGPy21KeM690R/5Y2pA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 59481E2D38;
	Thu,  9 Apr 2026 16:23:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 4AA5220029;
	Thu,  9 Apr 2026 16:23:11 +0000 (UTC)
Message-ID: <c30a3fe0a6c412b1d0092a2eb4d4d878288ca935.camel@perches.com>
Subject: Re: [linux-next:master 8662/12838] htmldocs: MAINTAINERS:40:
 WARNING: Inline strong start-string without end-string. [docutils]
From: Joe Perches <joe@perches.com>
To: Matteo Croce <technoboy85@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Date: Thu, 09 Apr 2026 09:23:10 -0700
In-Reply-To: <CAFnufp0qW40DrZPG5akNaoXanRNN2MBW2ougcwThtzAXh-z5VA@mail.gmail.com>
References: <202604090741.1kUVXMoc-lkp@intel.com>
	 <CAFnufp29D4VdTgoJ4uDk-dQ4-RuO_C6=TQ7O9TA5M=JSe1j+cw@mail.gmail.com>
	 <1c7e8c605d2373c26b08d0eb64cc56efd69dbc26.camel@perches.com>
	 <CAFnufp0qW40DrZPG5akNaoXanRNN2MBW2ougcwThtzAXh-z5VA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4AA5220029
X-Stat-Signature: xrwgsuz4q8pe7bdahf3p6qrhhf1wa735
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Iu0p2ACSkIh57WQTpSy6roLh7BVn0s4I=
X-HE-Tag: 1775751791-552619
X-HE-Meta: U2FsdGVkX18VL7pyAz7WgbByp+2K7LHFPmvcPDJcmZYAUwV/Tvv7vQ0beBGyaXFhKM2mJ/1M/WQbJjUAxOI5tWaaDSo/40gGbZPbyJ4aP7eyjImGMDS2BGAHzr797+0OGR//Em3O4FTsxY6kFYbVeLmewT7fRBknRVaktNkX+mMHOrNhNdNIpf0EC/DdWM+zFocEnY/HwevMtQ6H1pr8UKVGUh75J9UFAeNHPUTnEYoDTCx2mUFFnpkHpKOW9mvXkwpUOcVRvhVnzpBL4jcnPSEtLfJgdGQgQIyzt8orcaTiYegLvI2jZyogCkVwq1ADN28V+7PKPNqGsS1enll9p/Lpl6gaVqF8SLLcjA5Jg9gjxCdQuHz7J+wsIAqB8T6u

On Thu, 2026-04-09 at 18:16 +0200, Matteo Croce wrote:
> ```
> Il giorno gio 9 apr 2026 alle ore 16:47 Joe Perches <[joe@perches.com](ma=
ilto:joe@perches.com)>
> ha scritto:
> > On Thu, 2026-04-09 at 12:12 +0200, Matteo Croce wrote:
> MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [=
docutils]
> > > >    Documentation/userspace-api/landlock:480: ./security/landlock/er=
rata/abi-4.h:5: ERROR: Unexpected section title.
> > > The problem is that "**" is seen as start of a bold text in RST.
> > > Escaping the first * fixes error and keeps the glob unaffected:
> > >=20
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -35,7 +35,7 @@ Descriptions of section entries and preferred order
> > >      F: drivers/net/ all files in and below drivers/net
> > >      F: drivers/net/* all files in drivers/net, but not below
> > >      F: */net/* all files in "any top level directory"/net
> > > -    F: fs/**/*foo*.c all *foo*.c files in any subdirectory of fs
> > > +    F: fs/\**/*foo*.c all *foo*.c files in any subdirectory of fs
> > >      One pattern per line.  Multiple F: lines acceptable.
> > >   X: *Excluded* files and directories that are NOT maintained, same
> > >      rules as F:. Files exclusions are tested before file matches.
> > >=20
> > > should I create a fix patch or we can still amend the previous in net=
-next?
> >=20
> > nack.
> >=20
> > this shouldn't be fixed this way.
> > betterwould be to not try to format things that shouldn't be formatted.
>=20
> what about escaping it here?
>=20
> --- a/Documentation/sphinx/maintainers_include.py
> +++ b/Documentation/sphinx/maintainers_include.py
> @@ -89,7 +89,8 @@ class MaintainersInclude(Include):
>              output =3D None
>              if descriptions:
>                  # Escape the escapes in preformatted text.
> -                output =3D "| %s" % (line.replace("\\", "\\\\"))
> +                output =3D "| %s" % (line.replace("\\", "\\\\")
> +                                        .replace("**", "\\**"))
>                  # Look for and record field letter to field name mapping=
s:
>                  #   R: Designated *reviewer*: FullName <address@domain>
>                  m =3D re.search(r"\s(\S):\s", line)

I didn't know that file existed.  Fine by me as long as it works.
