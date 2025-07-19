Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F801F0E53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752923653; cv=none; b=YStL9hCHSw2PdFnPU9gGc7afLMy83NiHoTClmly+XgPTMf83aQ4JgMizkwRSZFcmNuTyMbsjlgguSsJ5lH8E31foh4AvpTDRJieIsLPz6yB1r9xttLyleKoIqn+bc3Lnwg2SsZfxXpYkebUzfVmjrB6OllnstgqEmbnnWPlkFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752923653; c=relaxed/simple;
	bh=uc2gaQMiQ6JYdBFB8fExxQY/GOXGhsa+292f6sggT08=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=KEbx2qzeADRhPm5OBUBBShgterHN9WsGiDnJgAwyu4SJVM23tqx0+FvYk+9K+/Qc9ZTuSNoWVtjTKMkYQMjIz4/4BZFAhROsbOS3KT/XTHCYxIfsTeli742cojvyVQ/Z/UP5dKD9bncnr5vaDIDNWUq9iiajQD0C40ShmRk/VHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=LiDr5DFH; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="LiDr5DFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1752923639; x=1753528439; i=frank-w@public-files.de;
	bh=XqKD/o2ZL6QMbJJDdKLlP4XkY7+Cx+jx+jQPOYN8M4E=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LiDr5DFHZmYsAs0H8avZEV0eVxbnFfz39YgD3AsbKmnH6uArc7JSLsK2jbXdNAKV
	 2yglNTB1utI9SSiZIpLawDqyYjTM1paHABst6Yh5j9hRHblbsnJMacUAagqzmpmQ4
	 6s+lUHeV9mMs/quwq3FXrTp1XL7iWZw7dFo1MesMnIm676Kd4kr45NwvlV7g0mzJq
	 rnr1ySsuOcSJ/o0zTYFRmZGf7Qo8G2ZaCVp9fWdPfumCJnMQpZqB9gP/tA7ep6Q2L
	 REqCUppriRkFyAOjZfoJii6smZ2uGTCe5U8YfeXhahe48YqS1US0yOV8YDnHPsuPw
	 7PU+2tiXxNX8cNiOfg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.65.254.167] ([100.65.254.167]) by
 trinity-msg-rest-gmx-gmx-live-85885f45cf-52hzg (via HTTP); Sat, 19 Jul 2025
 11:13:58 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <trinity-17f89562-ce7b-49a7-af2b-742c8e5cd9c3-1752923638895@trinity-msg-rest-gmx-gmx-live-85885f45cf-52hzg>
From: Frank Wunderlich <frank-w@public-files.de>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev, kuba@kernel.org, krzk@kernel.org
Subject: Aw: [linux-next:master 8067/11307]
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb:
 ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197,
 4], [0, 198, 4], [0, 199, 4]] is too short
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Jul 2025 11:13:58 +0000
In-Reply-To: <202507181819.yDa5ApF5-lkp@intel.com>
References: <202507181819.yDa5ApF5-lkp@intel.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:TrOJvLL2TqfzWz9AUyVUZ7l5HXn+6O96UNwqO9iO+mSJE+LkfIHLyEdtusMQOINnVhdcl
 jRPBov7kmXUcDEzwl+kRnE9mcNvpAGl/GRoukJl5lsGjxjvhJTJcEbzs1DbzXVWhaokH7XaQEcnP
 a3Fbq0mnWbMC7TCKBXXzySanm2aoNTReLhwJPekTO3L1vux+HQmr9KCumrGXnIslqGv8z6EO0lE6
 Xr8taifwL2LjyhYp2E1EGaSkfxe+5ZEGAfIWrBmU+DXTE4o8N1WqjoiUDphzjhzNnepLUKvCHgYd
 i1jTheibiPvq+IGtgMxH4UCfQe0utNqCXePE+FjP5Lx5EbnyaeieCFdiMLfbpEKtqE=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HkMkBfS2+4Y=;FKRIJQIrF5sSxvNWagVxArGwsDj
 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

Hi

this error occours because binding was applied and not the change for MT7986 dts adding the 4 RSS/LRO interrupts

> >> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
>    	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

regards Frank
