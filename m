Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D8624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 07:44:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-985b04c47c3so49472966b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 00:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686901463; x=1689493463;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN2REcXZLHkDizaZLroN/v4ItN0FexKCG0VYqab5Qpo=;
        b=e+P657IrlvSrpoL7qseymil4uYLY3fWtssRdWghpjjylzurjp8itex3eKktEv8zNUv
         N/r0+zeETe9+Y9h7FQAD7shzA4UWumHESbtgGBJZWmmOE9oikhGl4yxcaEmtZkE8LZ7c
         6UOJPRdNWmkv6N6iRJczKPz6TxeG4ZsjCgx7oU9wKZUbDtLEIoyCvJe0LxU6bqTatHAS
         GgAYTy42I7E8rwzgbnssUPVgcY20+TKla6wmSkBYkFc8cOeswv4Fxi1kDrMJfcn7g3NC
         aN8yOfaU9FzEaw7C6HENZ1VLgBfqJQXr2tNEJDZOBblDKvkL/puAod2fuudVlGBBbZfr
         E2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686901463; x=1689493463;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rN2REcXZLHkDizaZLroN/v4ItN0FexKCG0VYqab5Qpo=;
        b=TpNL5dflw14Wv7AHT/aRkzXGVpSSTeYpAm3wVBdMN80m10Q7KKKhBqAoYOjEpTACjH
         9eBv7jrrdZjJhEcvnVyfHPIKty9D9ReN/YIovkHXNcp83Lx1W8/BnOyJ4uh1ds4d249C
         idp9MgFUzYTUXwpj2vjf1aA9C0PIqrirwW97cG73HY2ixqBVd4ltdFoGSj2pi4impQ3f
         gutkeF744WslGIoUrIG+cYNWbPZbKOnFnQqEkrs9WNX8qaUX5FIVaSA1/BXyAc7mpc0H
         PE+71hphXYtvOSm/r+y8Ie0yFsA6u36tj19mASwiAlZggTjJPbC/32YOeOTcmxOyxYGa
         TP5g==
X-Gm-Message-State: AC+VfDyc5tn1K5r+6OPU8rWndC/SQzp37H6Qkz6xFyBG+bsI4YkrQUz3
	89VYWm5u+KGMLoucTuG+aKQ=
X-Google-Smtp-Source: ACHHUZ7pPA3/BW059I6C5lJNbbB9g4Y/afesR/awu8piiBoE2S4p+R5WzdtpRiPhImzmHkMXKV+2JA==
X-Received: by 2002:a17:907:803:b0:973:e79c:3da8 with SMTP id wv3-20020a170907080300b00973e79c3da8mr1062125ejb.17.1686901462673;
        Fri, 16 Jun 2023 00:44:22 -0700 (PDT)
Received: from gmail.com ([81.168.73.77])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709061c9200b00965a4350411sm3035012ejh.9.2023.06.16.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 00:44:22 -0700 (PDT)
Date: Fri, 16 Jun 2023 08:44:19 +0100
From: Martin Habets <habetsm.xilinx@gmail.com>
To: edward.cree@amd.com
Cc: linux-net-drivers@amd.com, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@google.com,
	Edward Cree <ecree.xilinx@gmail.com>, netdev@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, simon.horman@corigine.com,
	pieter.jansen-van-vuuren@amd.com, naresh.kamboju@linaro.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 net-next] sfc: do not try to call tc functions when
 CONFIG_SFC_SRIOV=n
Message-ID: <ZIwS03v672Qc+PJb@gmail.com>
Mail-Followup-To: edward.cree@amd.com, linux-net-drivers@amd.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	edumazet@google.com, Edward Cree <ecree.xilinx@gmail.com>,
	netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	simon.horman@corigine.com, pieter.jansen-van-vuuren@amd.com,
	naresh.kamboju@linaro.org, kernel test robot <lkp@intel.com>
References: <20230615215243.34942-1-edward.cree@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615215243.34942-1-edward.cree@amd.com>

On Thu, Jun 15, 2023 at 10:52:43PM +0100, edward.cree@amd.com wrote:
> From: Edward Cree <ecree.xilinx@gmail.com>
> 
> Functions efx_tc_netdev_event and efx_tc_netevent_event do not exist
>  in that case as object files tc_bindings.o and tc_encap_actions.o
>  are not built, so the calls to them from ef100_netdev_event and
>  ef100_netevent_event cause link errors.
> Wrap the corresponding header files (tc_bindings.h, tc_encap_actions.h)
>  with #if IS_ENABLED(CONFIG_SFC_SRIOV), and add an #else with static
>  inline stubs for these two functions.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306102026.ISK5JfUQ-lkp@intel.com/
> Fixes: 7e5e7d800011 ("sfc: neighbour lookup for TC encap action offload")
> Signed-off-by: Edward Cree <ecree.xilinx@gmail.com>

Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>

> ---
>  drivers/net/ethernet/sfc/tc_bindings.h      | 12 ++++++++++++
>  drivers/net/ethernet/sfc/tc_encap_actions.h | 11 +++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/sfc/tc_bindings.h b/drivers/net/ethernet/sfc/tc_bindings.h
> index 095ddeb59eb3..a326d23d322b 100644
> --- a/drivers/net/ethernet/sfc/tc_bindings.h
> +++ b/drivers/net/ethernet/sfc/tc_bindings.h
> @@ -12,6 +12,7 @@
>  #define EFX_TC_BINDINGS_H
>  #include "net_driver.h"
>  
> +#if IS_ENABLED(CONFIG_SFC_SRIOV)
>  #include <net/sch_generic.h>
>  
>  struct efx_rep;
> @@ -28,4 +29,15 @@ int efx_tc_indr_setup_cb(struct net_device *net_dev, struct Qdisc *sch,
>  			 void (*cleanup)(struct flow_block_cb *block_cb));
>  int efx_tc_netdev_event(struct efx_nic *efx, unsigned long event,
>  			struct net_device *net_dev);
> +
> +#else /* CONFIG_SFC_SRIOV */
> +
> +static inline int efx_tc_netdev_event(struct efx_nic *efx, unsigned long event,
> +				      struct net_device *net_dev)
> +{
> +	return NOTIFY_DONE;
> +}
> +
> +#endif /* CONFIG_SFC_SRIOV */
> +
>  #endif /* EFX_TC_BINDINGS_H */
> diff --git a/drivers/net/ethernet/sfc/tc_encap_actions.h b/drivers/net/ethernet/sfc/tc_encap_actions.h
> index 4d755fb92daf..c3c7904ad7ff 100644
> --- a/drivers/net/ethernet/sfc/tc_encap_actions.h
> +++ b/drivers/net/ethernet/sfc/tc_encap_actions.h
> @@ -12,6 +12,7 @@
>  #define EFX_TC_ENCAP_ACTIONS_H
>  #include "net_driver.h"
>  
> +#if IS_ENABLED(CONFIG_SFC_SRIOV)
>  #include <linux/refcount.h>
>  #include <net/tc_act/tc_tunnel_key.h>
>  
> @@ -100,4 +101,14 @@ void efx_tc_unregister_egdev(struct efx_nic *efx, struct net_device *net_dev);
>  int efx_tc_netevent_event(struct efx_nic *efx, unsigned long event,
>  			  void *ptr);
>  
> +#else /* CONFIG_SFC_SRIOV */
> +
> +static inline int efx_tc_netevent_event(struct efx_nic *efx,
> +					unsigned long event, void *ptr)
> +{
> +	return NOTIFY_DONE;
> +}
> +
> +#endif /* CONFIG_SFC_SRIOV */
> +
>  #endif /* EFX_TC_ENCAP_ACTIONS_H */
