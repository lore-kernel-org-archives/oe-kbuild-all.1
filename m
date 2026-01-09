Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D5A3033C9;
	Fri,  9 Jan 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767998506; cv=none; b=c9cpFHAfrea8nZXhu8nwyNburFCWfCDXYlTzq7X28HjdecRJtm8LcAaaHbYlLYisqSpK97I/2GwC8hExAAFnMuxdfH15hGSbuSICXK27ixZ4ECl1wEmm52mSNpO9hHfDGyodEhSn8IP5JRZt2UtRJecNGG+zsp6BIDg1Wdmqzxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767998506; c=relaxed/simple;
	bh=VBbcJ2T87zU0e1LhlXj15T2/IVt0jx3zG82HmG99AwQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NnyTrZCq2NRuAreF5ExiTlbN1DpHlBeNoOae42TGAmdGiA+SSqaumJnsq8XkRfFm4jPtjhp8eowmM15YHVuGUgmvR1IP5O5eyYS8siUfebIrRisv8CTbgrwv++/5oIqCjqbuldfEyj/LjT7hY8oMshwsKa7ecTds1zGXIc4qcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=sAQzpDUh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="sAQzpDUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A403FC16AAE;
	Fri,  9 Jan 2026 22:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767998506;
	bh=VBbcJ2T87zU0e1LhlXj15T2/IVt0jx3zG82HmG99AwQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sAQzpDUhHvmt6mXKj0Kwb3jXB7xUTeKfPCitkT50m4DVQeSo3j3EWkETfXV1TnQR5
	 qInyZ/I6xmBEuCFxGMz8hbzOtsB1IJ87b+KPiWGvhIiEZBEt543PFEI5JpYzbKbjFN
	 mR2VJWt6N2IvxA9CKTUam2xFSvEVmPtcl/t4lyyQ=
Date: Fri, 9 Jan 2026 14:41:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Pnina Feder <pnina.feder@mobileye.com>, oe-kbuild-all@lists.linux.dev,
 pmladek@suse.com, bhe@redhat.com, linux-kernel@vger.kernel.org,
 mgorman@suse.de, mingo@redhat.com, peterz@infradead.org,
 rostedt@goodmis.org, senozhatsky@chromium.org, tglx@linutronix.de,
 vkondra@mobileye.com
Subject: Re: [PATCH v5] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-Id: <20260109144145.bc6cc6042f1e70430451e3b9@linux-foundation.org>
In-Reply-To: <202601092335.DbBERt3l-lkp@intel.com>
References: <20260108203612.955769-1-pnina.feder@mobileye.com>
	<202601092335.DbBERt3l-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 23:19:34 +0100 kernel test robot <lkp@intel.com> wrote:

>    kernel/panic.c: In function 'do_panic_on_target_cpu':
> >> kernel/panic.c:327:17: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'void *' [-Wformat=]
>      327 |         panic("%s", info);
>          |                ~^   ~~~~

Thanks.  That's what you get for listening to akpm ;)

Stupid compiler.
