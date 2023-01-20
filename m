Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADD517F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 11:02:36 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4FB6660230B;
	Fri, 20 Jan 2023 11:02:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674212554;
	bh=D1HAtBqHAur8JaHevw9CchxdQMYmjJCpCGW+M/tjShU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Eh2gJVEnl9CTANbedBJfnefEqIiZbcki65abJSvaucO6ovmqitxOj07kJ1zSr+pJa
	 lhIl4WinFUTlp9Wh+weNn7awtx+OCkK7rmwb/o4Suo47ezhavBWi2m6BBMNp2KZGj0
	 JmsbLQkNmCoWz0051NeYFCJy8DaEgy1O6JhERv/xKIHCPnMsUkp+VlDTnjak+kLOi+
	 o59D2ddNwTodviyO05AAFrD8+CDS7lRR6T66Jj4I26suiAn2bJQP0OSUM1f8YowvPh
	 QSbTfDwjfGl+uIUl9aLywgdAEMSK1XmSp8GL6d7XFDLsGg66UVzjh/h1DgfGhXcI8o
	 JniLx1Wz6bL+A==
Message-ID: <5ffed624-81e0-ab8c-bf68-84fc700239cc@collabora.com>
Date: Fri, 20 Jan 2023 12:02:31 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: SOF: sof-audio: prepare_widgets: Check swidget for
 NULL on sink failure
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 error27@gmail.com, linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev
References: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/01/23 11:21, Peter Ujfalusi ha scritto:
> If the swidget is NULL we skip the preparing of the widget and jump to
> handle the sink path of the widget.
> If the prepare fails in this case we would undo the prepare but the swidget
> is NULL (we skipped the prepare for the widget).
> 
> To avoid NULL pointer dereference in this case we must check swidget
> against NULL pointer once again.
> 
> 
> Fixes: 0ad84b11f2f8 ("ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


