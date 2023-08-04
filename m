Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4319883
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 16:05:25 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-31765aee31bso1844889f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 04 Aug 2023 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691165124; x=1691769924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ox8Iga73YVuYG7AbvArZALqGxDCiOsgsOfD0SAAN2aw=;
        b=MYpTL98vMojDZtPFROL7yzKAAkuwF7MrpzXffQSomKIp0MsNlFbe3ucjOtH/hOInjD
         HT4hV3dUoNOWdgU2+VrD0niOZU8RDhYmT4M6Sz3vkxz8uNl53cUty8frMU2WtJuMnm/U
         N2VANZ2MLeApumKbnzazGM8B1lxAm2lovOiPVURlxYrOxZlDww5jd/9iVJ8PXJqdpXur
         LShLGnQscLSLrvSZno/Vqlse+deZmsAlJFK3eRlz5/TcVrueArvZPRRk/gFn5xzSpCYe
         +7IJq+5qZ7rFWfydgKUirSv/dG6XNrrZhdT2EQ417VOAn5/d633BBCAWzdj7j5mmkF+J
         Kl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165124; x=1691769924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ox8Iga73YVuYG7AbvArZALqGxDCiOsgsOfD0SAAN2aw=;
        b=ftcxP4CVtO5Ot9vAAB4inLHdqgC7fB1h3RYf+HNy3jYZlJlVsu3dxJQCkcVrYWxkrL
         JzDj5aDyS7mReyrsPgRjBJUMTW+qwG7AhY37Oxnn1KQD+pcJaM+cwfwN+BkQioKkTRHw
         ck1i549tY2921w5tE/j+blA7SmyuH7u/KlqpaDWLBdTiv56RfIBYSpw2Ca4Fmw213EIo
         SePM3/hdSXaGqV4qT46NlgUaLCevHOVGnIPeMcJ5uRzOaxjEQibdbWFn13lNs2xn5PSJ
         uBqwwLANVEQOkRw3v8M1WgLHtb/Oa/JpKmIxIbNr9vDoIW+mWXkXfuwA1m0tfX4n0o8K
         xg6w==
X-Gm-Message-State: AOJu0Yx8yI0E1XNp0Z1GfmC3RCfCDvzZ3abZtb2YA+fz5DlnXw3+8P7v
	RuEJsw+O9yFCfrj0AdMlGcCHXZNKLOT71SmDzB4=
X-Google-Smtp-Source: AGHT+IHHk/v2jjUyrx3GaDx38eWLyd6yfqNnQpWrCXoIz3KI9OmMFfu96D2Q1NM7SUuF5X1sdm9Kgw==
X-Received: by 2002:a5d:67c6:0:b0:317:393f:6e6a with SMTP id n6-20020a5d67c6000000b00317393f6e6amr1537552wrw.59.1691165123848;
        Fri, 04 Aug 2023 09:05:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0031753073abcsm2823192wru.36.2023.08.04.09.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 09:05:23 -0700 (PDT)
Date: Fri, 4 Aug 2023 19:05:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Michael Walle <michael@walle.cc>, linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH v7 5/7] nvmem: core: Rework layouts to become platform
 devices
Message-ID: <3a4aa779-f8b8-4178-8d65-b6aae9183fb7@kadam.mountain>
References: <20230801182132.1058707-6-miquel.raynal@bootlin.com>
 <b9040273-aca8-432a-83aa-b0d6b1b88529@kadam.mountain>
 <20230804173903.2b298cd3@xps-13>
 <20230804174625.4c27fe9a@xps-13>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804174625.4c27fe9a@xps-13>

On Fri, Aug 04, 2023 at 05:46:25PM +0200, Miquel Raynal wrote:
> Actually of_nvmem_layout_get_container() already returns NULL if
> CONFIG_OF is not defined. This helper returns either a valid pointer of
> NULL. Where can it return an error pointer?

This is from linux-next.

include/linux/nvmem-consumer.h
   256  static inline struct device_node *
   257  of_nvmem_layout_get_container(struct nvmem_device *nvmem)
   258  {
   259          return ERR_PTR(-EOPNOTSUPP);
   260  }
   261  #endif /* CONFIG_NVMEM && CONFIG_OF */

regards,
dan carpenter
