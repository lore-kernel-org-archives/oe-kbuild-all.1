Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337007;
	b=t1AD8PNaa3xd/nlVyjX5z38xHY6PkdazKYqq00jdul5nchqWIR6Vd1v4W1A30pQr61wt
	 9HhxGR7WuW5zxBApclQfqChBQs9nNqBEsc+XZ/gs7UT9PVRNQUvM7t0a5ISobIsXWId57
	 Zd1KlfxOfGIsKutKwM5mm64DdGYLf8hCI4Cd41Ay6AxmxIXoeu+tGC953fVHLhEhQnHtj
	 qImfl2Cx7r7oEwVEs+LveRNTuhebajkEVUtmquE2/E1Vo1wIlYMeq9lNjGOcHvjnfHBMM
	 EZKVzQvJpEmRDEyYjfyCLRBOC7vPzbzbKLQ1klhuh7WgxgHpNcpcRr4Z7e/rnpQXbcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337007;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kQSjpRkLhJ3MmjhWRGrwwqa6QqXZ8qzNkGmLYEakllQ=;
	b=fiztYZ4inYQx+5mdJ4k09icgV7G8+u1bj2O4SDddhj4ZU+M51IHgn+ZLZf44TMLP2OxQ
	 BsLbb6b0NuEkOOYwKIHdBZX89n1qd2BNqsN+iQIWnUiNnPolJ3LPaszBF7EctxeftGwr7
	 DaGyIhlOtP5LzutQDEspU5U9SPkhJQhJea8iR56Jaw8E4YnPl3OPyVsKTXKlfxS6Ijjgx
	 jlbc14Z5vHP4rq1V2fHYyOs5jrXKlk/n+0NGhm3+tb+jakTty0QZE3YOyNTWmnFmp3MUh
	 whaRxYu9QJZmS3OKgodk7kQrmlgVfjIci1JGkhKdKRu+DWre14ofeIAv4t0FNbM5O/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=ovaMj8qW;
	arc=none smtp.remote-ip=95.215.58.59
Received: from mta1.migadu.com (out-59.mta1.migadu.com [95.215.58.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9520606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 18:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9520606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=ovaMj8qW
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=2DL3rl+rMQtbPHNfe/VkSh1vOHFeZi6JunlnhjAs+Gw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794337003; v=1; x=1794941803;
 b=ovaMj8qW6D6q5ugifWnb1Sl8MCktDkmt2V7e0KeUoq3nnM0MTLHc6aZqH3JJNxMc/FgBgxN4
 riumrtRuOsAOju5LVQ27+eLqAIpWaROhxUa+7vdNCvy8oLQLjpbHfwS6TUcyXd+PYtCEC3uq91w
 ti74ljVPQRoJghRe0ojRSBs/axmR3+xiz+hPpedaBXjA0w9fyBjB7pYLpcIcWd8Y7uYvX/u2u0b
 oVMPcQGQsOXOZur/OwmaJGhNaswiBVWo8t/HNsZUxNpUNmQ+7HWp4ms74Pg+34XuObgcCm+Rm1Z
 mjKQJQiHdGBNL7p/gEZnCjBJHp3yQq6hjMuyXyzMF2Cbg==
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 40fe415b35cf92f9;
	Tue, 10 Nov 2026 18:56:43 +0000
X-Mizu-Trace-ID: 40fe415b35cf92f9
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: kernel test robot <lkp@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	oe-kbuild-all@lists.linux.dev,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
Date: Tue, 10 Nov 2026 11:56:37 -0700
Message-ID: <20261110185637.13126-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <202611101719.St87Ty1E-lkp@intel.com>
References: <20261110005846.38432-1-lucid_duck@justthetip.ca> <202611101719.St87Ty1E-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 05:27:20PM +0800, kernel test robot wrote:
> [auto build test ERROR on wireless-next/main]
> [also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261109]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

Wrong tree. v2 is for Felix's mt76 branch:

  https://github.com/nbd168/wireless.git mt76
  base-commit: 8739e5b44b23

> >> drivers/net/wireless/mediatek/mt76/mt7921/main.c:385:16: error: 'struct mt792x_phy' has no member named 'roc_notify'

That flag comes from 2466ffac172d, which is in that branch and has not
reached wireless-next yet. The clang report is the same thing.

Devin
