Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819E36126
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709978569; cv=none; b=LLj4FxhHYO1el200DxltfUiBpF6MJN9gkIkU2q0qN3JMucXsEiWfbKYSKUeZzShNy3UVJ3hhoHL6rd5IjcY6Oi6mE6o9xAZszi3reOn7sxbu9XdHJkMDz5Ak8QUGiluPWhN4gIrGs3pH7/y48K7YecWCN14Cn1utOW1Oq59Le94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709978569; c=relaxed/simple;
	bh=goyu6y1PbvT4bGe0vBPvrXtOHaevktfIYGnJFl8WfYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkosDM1j3oynS/6CcRz10RbujqLOiV2wLXP7H6uV5V3o/3n6d3cd3KvhMOyKC4X3DB6KA/zw/Hr628WrHIpGLva8DYiju0dIFyjyB05QQcHdQo22UuzqHS1s5eS/JAti+YAI5F8Uc4LGrOIq7er0fUUnyN2u2DWgNZpMZJjwdUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kxepB/Ls; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kxepB/Ls"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3684640E0185;
	Sat,  9 Mar 2024 10:02:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EfMJFCxzBYCf; Sat,  9 Mar 2024 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1709978560; bh=pdueaPXsmkHCY9cGQmYYl9tl/9g0vKpCRtGe/3b8uNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxepB/LsUoj1led7DCDBFWS0mrYWefxLW9n+RtQ8PxvzuvZX8MDQlmUetcqoLUyB2
	 ItoLr7lOfJOOLNeFlWUzzUtOsajlvnO+d7R6EauWIxpK67r2CfYTApJhR4HdhSSGZ2
	 oqw4x6PlQc1A5jHV8Lhj6gdFjL19WxQtapE96EAVBRQmyZNo2S+i9KrfFhOU8Cfiac
	 z2ZGxyxAUIAYOmmgqvpXb5b1ZjM/3zJ1eWezDmtA2RwMe8tzVGyQoa4F5M7X+QP0yJ
	 UqsY7hRyIhgJWIea9sBExlYVn/KUNKU4QovXBnT9933a1A/wBo+3KmEXm/aImX050k
	 4hv8PiUw3PGM2Ll6xZXPChXpzNDZnQUznE6YBzhd4l2Y+X0FuIdvj79cmCaDVF8jb6
	 p8MrxTnBhHx+OLwSioAXHaatyXCeSbxr+Ctxv8ARGJMgR9Nha8GvKIOLthIdYo7ihI
	 EW45R9o2O6zdNwX7YI/juG2mM6ATZyHrORWTJilpGlsUz6AKGX9R7qFmptwUgg6v5n
	 VGs38+4XdlLL9zlikJA8FZhRgu9QkVordldvr6BXELxJdyzJadWr2yu06k/qqxWkq6
	 M1eawQUElP6qIDCQVD5iT/zOVzJzYBwhC70ziBqcD2Ss2B5weoOwwTHs/RqOWeZD3i
	 SwpBVEiqooN190i05hsPOVJ8=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B647940E0028;
	Sat,  9 Mar 2024 10:02:36 +0000 (UTC)
Date: Sat, 9 Mar 2024 11:02:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1444/12944] /usr/bin/ld: cannot find
 ../lib/api/libapi.a: No such file or directory
Message-ID: <20240309100231.GBZewzt2ueVJcNzZHV@fat_crate.local>
References: <202403090834.EHWSv1gO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202403090834.EHWSv1gO-lkp@intel.com>

On Sat, Mar 09, 2024 at 08:51:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> commit: 3f3174996be6b4312c38f54d5969f5d5b75fec9e [1444/12944] RAS: Introduce AMD Address Translation Library
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090834.EHWSv1gO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403090834.EHWSv1gO-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> >> collect2: error: ld returned 1 exit status
>    make[3]: *** [Makefile:22: page-types] Error 1
>    make[3]: *** Waiting for unfinished jobs....
> >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> >> collect2: error: ld returned 1 exit status
>    make[3]: *** [Makefile:22: slabinfo] Error 1
> >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> >> collect2: error: ld returned 1 exit status
>    make[3]: *** [Makefile:22: page_owner_sort] Error 1
> --
>    In file included from commands.c:10:
> >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
>        6 | #include <netlink/netlink.h>
>          |          ^~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/commands.o] Error 1
>    make[5]: *** Waiting for unfinished jobs....
>    In file included from thermal_nl.c:9:
> >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
>        6 | #include <netlink/netlink.h>
>          |          ^~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/thermal_nl.o] Error 1
>    In file included from events.c:10:
> >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
>        6 | #include <netlink/netlink.h>
>          |          ^~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/events.o] Error 1
>    make[4]: *** [Makefile:105: tools/lib/thermal/libthermal-in.o] Error 2
>    make[3]: *** [Makefile:120: all] Error 2
> --
> >> thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
>       21 | #include <libconfig.h>
>          |          ^~~~~~~~~~~~~
>    compilation terminated.
>    make[3]: *** [Makefile:23: thermometer] Error 1
> --
> >> Makefile:65: warning: overriding recipe for target 'emit_tests'
>    ../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
>    make[1]: *** No targets.  Stop.
>    make[1]: *** No targets.  Stop.
>    make[1]: *** No targets.  Stop.
> 
> -- 

Does a human look over those reports before you send them out?!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
