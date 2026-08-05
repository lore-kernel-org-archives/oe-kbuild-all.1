Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26E3C2D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 18:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953847; cv=none; b=fn7UCN/Y1vSNZFwb7OxQt5ZyteBh2pZ0TQYyMBl1PIJo8L+iprLsrY5AzzvvqJdN5i702LOZNNKOFLjyHb3KmZiMVvUiSTPya1Qq/iIXATwXhyMPCjHmXESf5XeS6if+IxWLspOqs85LaV5T9UL7sQEywC/ev0//ihRd3oZ6FOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953847; c=relaxed/simple;
	bh=NDEZAnm94+RVme1BYoA+Hidgp5Hle8R5E9bhRJAOdMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSSVLnCFioFxAeNJuOByFpu10JV104CnaXgTi0DiX8TOl64HkSnysfsBhFuE4orgAv8fqZphb1i3L124Ei3U4+F/v5A6Pwqw7Se8pUsbPMJ1Tc7y3vLSzlREWmVEieT9ivr5Is7b4RueuvHdiIOlKVEa3AFtO9pfcIcS+CmAyKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 214F11A0590;
	Wed,  5 Aug 2026 18:17:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 5CDBC2002C;
	Wed,  5 Aug 2026 18:17:17 +0000 (UTC)
Date: Wed, 5 Aug 2026 14:18:08 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value
 returned by memory allocation function to (struct buffer_page *) is
 useless.
Message-ID: <20260805141808.1ae45169@gandalf.local.home>
In-Reply-To: <8395acdb-9a3-cb8c-853-43f238ffc15@inria.fr>
References: <202608010824.vc7vATf0-lkp@intel.com>
	<20260731202804.06a4056f@robin>
	<8395acdb-9a3-cb8c-853-43f238ffc15@inria.fr>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: w1wufpgk1hpstcwu7hysrbpfdhmfpj88
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 5CDBC2002C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19CW50pkMxa/g4wnteDyuYKxcYld86dLVM=
X-HE-Tag: 1785953837-983152
X-HE-Meta: U2FsdGVkX1+bMnrfaJ+KdHtx4j3vQD8tSX9USjyKurs888qU4yr462ZLHdP0/Cy/MPPQbwgR3hEV+PPcLXGzTUVWg1SjAktUVMTNkYlaHCKMum/ng/miXoeySoZMaW8tTpzIswaiQ1J0OcNcrGC+gKMSS41YdP2aC/B/vDKsTLoREQnqoZa0irDBz3A6I5BeBVsulto+9iZbW/oDnEAZsk+BBFYZabkPib/3EbAC5rQCgxzf1L26RSJgImg4nJsWMcGbtj2RzN4Mr15eqA811l79dtgrFYHg0UFRUVpmfxv/jRYo+FoGtEPnwCWFy4XNWp/2G7vTrlZuG37+ol0OZx8eHQcdvxc+m5MNaMv0fVE=

On Sat, 1 Aug 2026 09:05:10 +0200 (CEST)
Julia Lawall <julia.lawall@inria.fr> wrote:

> Thanks for the report.  I will remove the warning in the case of a macro
> body.
> 
> Is there some reason why it is not an inline function?

Hmm, probably nothing more than they looked better as macros?

-- Steve
