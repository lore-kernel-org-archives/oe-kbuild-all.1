Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594F38BF96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036917; cv=none; b=eB4tDcrjiU3Rc5KfIf8QncF8hj9V1fCEFN4tlXxREpN1rsW9xTufCQXmOQaelEvB8r/3lNp1hS5WHSADd6PmHFh5aiLyKb3GGM5JIZ2Ahl+VWJPStOxMDlWpQP47KyOI0lfOq4KzNil5+qLPajVLKeLKSZaiOlOiFMCm1ZK4qNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036917; c=relaxed/simple;
	bh=gSDWsFQQZrOFx7xkm6Ie0yCMLyLFQHeQQSd7E9WghFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLVlW9A+I2SNkswAj/KWiu82Ek2a2HQktJj1mJoqkOxbC5u+7gD3BoTI0ZO8/asd9SsFiZTsIGrdhyawxkn9NgsTNK7MMcuIQwPwAgba3GKzpgabwJ0btagBZMw4/wHcBSVklrulLLRMKbHhWOq045LjIgb2ia9TX2WThN+DdWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o9g5Iz0Z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vd6jotBp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o9g5Iz0Z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vd6jotBp"
Date: Fri, 29 May 2026 08:41:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780036914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSDWsFQQZrOFx7xkm6Ie0yCMLyLFQHeQQSd7E9WghFU=;
	b=o9g5Iz0ZYV8nqjLGsSSC/WAjVba4bYKQjpC/hQMiFCj8bEQOr7HVVRrHDq2k1Hvq9oCKWf
	dw8Tc34NbqhSRbsuLgbuXVa6BCTnXVuE62DlGctkMcQJOWI6ZFqaGbKvh00s5JaxYwhdrJ
	SRd+HcdTcmWK8KBlj7gDsROnd/KfzcoCJHP4Bbi+TiVPvgl88fd78JPZjcINZM5UO+QmqL
	LBVkmtfzb1fiAyGTxJ+ZHmN4c+9XW1LHShkscbgWEWk8iHsWXoelGak8L9cklqcMAdfhQg
	AlK35QEDAcTwcGHCjqXyo4UiSsLQV8MkDLKpWg54Ot6j67uTFuohbiVAMLWDHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780036914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSDWsFQQZrOFx7xkm6Ie0yCMLyLFQHeQQSd7E9WghFU=;
	b=Vd6jotBpxdxGKEiLodQ30LnthkTEWEGCqoqfJ5Zh/VtvITqEpALWTijbogDzi+erC4Fb0q
	d7NOFmh9BVRwiXAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:smp_call_function_any 4/12]
 kernel/smp.c:806:28: warning: assignment to 'cpumask_t *' {aka 'struct
 cpumask *'} from 'int' makes pointer from integer without a cast
Message-ID: <20260529064153.O841fTxA@linutronix.de>
References: <202605291433.OHkzEFaS-lkp@intel.com>
 <cff3a200-0473-48db-8027-435ff7832e42@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cff3a200-0473-48db-8027-435ff7832e42@bytedance.com>

On 2026-05-29 14:39:09 [+0800], Chuyi Zhou wrote:
> V6 fixes this problem by explicitly including <linux/slab.h> in smp.c.

thank you for confirming. Will replace asap=E2=80=A6

> Thanks.

Sebastian
