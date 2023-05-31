Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05BBA2B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 08:11:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f5021faa16so3662146e87.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685520705; x=1688112705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=djQp6xXJB76HLCESd2F3vNeh5AutF5do3+uW6pj9IuA=;
        b=dlgAi76fwrHBNV3xO0if+tVJBJVOd5Ea5U31Jkukoh83W3PISrWN1bUnmnrYhsjlis
         FH52Rq0t1Yf5S6z3MgfwjegEa8GmmJfAYgp3DRrI7YdaRfEYX1L24oMO23MULlHTDMF7
         TedjM96r1F766DN6A6LBpcriY/+oOsbVcggxZOmv/43Hu5dYZH8SISQZDXmghHJR/uKK
         2wKPviZC6+tewJVn5yOEIde3DRmoAm2t5TPVL3OH1MygBSkyqfKiYBfBQ9V4kZvUYLlF
         kMl6PxVe1fzTwb4n8qd/S1QPrbXaj9KCseS9yU3drnWqgfebEMpZww+Mri1uHYFAYiQz
         PW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685520705; x=1688112705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djQp6xXJB76HLCESd2F3vNeh5AutF5do3+uW6pj9IuA=;
        b=lN2kmNLUyjOyrgjGgOayAzttAjXrCwW3FiRAAgIJ8B3E2Y1KkWYppxpLRRmh+HtPlu
         P6gj2neSjkCeYjGRxkyyDaVGfFkKqroPQvdEjChlAl8e6rKkb/qmnNxqCbl+MQ5GQfPX
         0Ze7K3LWG4TOdh/feigShvYvZXpBAX3mlak1GUywmsIsSQ8ZYrAe2+68AunKP0kaR1qk
         EA+3qhdjv7xYSH/YqpgkcFGRReXSCd0Azao51QBYeB3S63lWNSZGYZ/DfBqx2HQNuC3s
         QWVT3GYK5Kyt67DVQB+iYDWN85b5QL0mySMhwDTZJAZ3JAhhSGJ59TLLMYDR0RipZ9wq
         vP5g==
X-Gm-Message-State: AC+VfDz2pTcSvAdcTf04Nkf/ME9FO7lqk9DAbrfAMCk3fGN8XydCSrAO
	NqqAd9A73s4BDKsMVzyKrmDqDA==
X-Google-Smtp-Source: ACHHUZ5rYHDeeSg0XtC/27c5tpai1Ctc5llD+NlGEP/YA8e4frgKM7+jMqUn4iigN2Wk40R4dtfXAg==
X-Received: by 2002:a19:f706:0:b0:4f3:afcc:e1bb with SMTP id z6-20020a19f706000000b004f3afcce1bbmr2012530lfe.1.1685520705131;
        Wed, 31 May 2023 01:11:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c24cd00b003f4dde07956sm23395334wmu.42.2023.05.31.01.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:11:43 -0700 (PDT)
Date: Wed, 31 May 2023 11:11:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Simon Horman <simon.horman@corigine.com>
Subject: Re: drivers/net/ethernet/sfc/tc.c:450 efx_tc_flower_replace() warn:
 missing unwind goto?
Message-ID: <2fca6bb6-a964-4b77-b99e-fad244fde732@kili.mountain>
References: <cbbbf576-6788-4049-b1e8-a05862f62cc2@kili.mountain>
 <4eabd7b1-66b3-7b3a-cabd-d1876767c49c@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4eabd7b1-66b3-7b3a-cabd-d1876767c49c@gmail.com>

On Tue, May 30, 2023 at 07:26:46PM +0100, Edward Cree wrote:
> Guess efx_tc_flower_replace_foreign() now has the latter problem
>  too?  (And it _does_ want to use the failure ladder, because we've
>  got to release the encap match.)

Oh, yeah.  Right.

regards,
dan carpenter

