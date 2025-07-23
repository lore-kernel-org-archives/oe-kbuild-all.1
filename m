Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8BA2AEFD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753253209; cv=none; b=Bu9R7Vnr3bYOvFCZw7x1ydAcqcvlefeajK0i5XRdEonP5+kxNNoKRLAIMSktYV4e6UWK2049kh5GV8Kn3KRV3irBMhNwfCgIHrYxbEdLNIGxdFsBp0HW0gnbK4bA2XzU21zWqj3OywaMS6SV/Xrlk8oAtO6IEskbw4HaRs2y25Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753253209; c=relaxed/simple;
	bh=gpWbCAjXez1EPlkp4rpA5YJ4H13HFenPzgIu4yE4BZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAtvX9UKeC2gFQcbN01tmejUIAvTbDVxg/SrOx/6dUTdq8IvbTItTggNBFURcGkZzVEfCBsvUvPMlSrzDaq1s+SiR754+Nzgq4hXkvDa5TIpVoZtqAh3Ai/o10tSlfHeJKEO2uoPEumXoI6/Ka76Al/pE21MiGOarUMwrR7+itY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G11LYP03; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wI/feB5L; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G11LYP03";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wI/feB5L"
Date: Wed, 23 Jul 2025 08:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753253205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fCJ9JAHWxqTx26LF63baVWxB9FCEaLCQkB+LlAbS85g=;
	b=G11LYP03ph14CllzuWj6PadkIecvLojboqZVSRjCrNJ9aIah80FUbF+L9snx4t6KUWAOsF
	4x/OIzNH4RskLGTo+u9mI25RtnxkQlDYLfGUisGNuzP7Oxtdwk1e+2LzuxLrYk+nBaYn/8
	F69d/cQL0aN1RBi50lRBuK3ZlNOI3mOW6/kQ5CBOIYrbgLv5bpQo/ox7F6PBnU1GdWvZag
	DQHrvnx2LG3fkXPVTkeJZjOZCTeVEQa+re1+3Ikda1vnbmOehhMENb9syTSdRmK8e8z1G/
	a1x+x7QwVgjKd++MBNCVDUXrBPcyJ1B/ePC91XAQz83L4yrbvyTFS/be0HgFTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753253205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fCJ9JAHWxqTx26LF63baVWxB9FCEaLCQkB+LlAbS85g=;
	b=wI/feB5LahmCZjYgYGGvuv4k7Q8XFVQ8USQfFREurwR31JbHxH+FI4y9s+Z0rhxA9Mnjpy
	j54YZwSSLkPiBgDg==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Subject: Re: [linux-next:master 7423/11552] kernel/trace/rv/reactor_panic.o:
 warning: objtool: rv_panic_reaction(): unexpected end of section .text
Message-ID: <20250723064644.xqO9OhyX@linutronix.de>
References: <202507222245.JgnoLxRS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507222245.JgnoLxRS-lkp@intel.com>

On Tue, Jul 22, 2025 at 10:22:01PM +0200, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   05adbee3ad528100ab0285c15c91100e19e10138
> commit: ff4e233d8ab70fe6ae460ecc8c0e5b24dd0fedb0 [7423/11552] rv: Let the reactors take care of buffers
> config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250722/202507222245.JgnoLxRS-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222245.JgnoLxRS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507222245.JgnoLxRS-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/trace/rv/reactor_panic.o: warning: objtool: rv_panic_reaction(): unexpected end of section .text

Already fixed by:
https://lore.kernel.org/linux-trace-kernel/073f826ebec18b2bb59cba88606cd865d8039fd2.1752232374.git.namcao@linutronix.de/

Nam
