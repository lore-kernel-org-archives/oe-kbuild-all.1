Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23322D50
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 19:00:48 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-39ab96e6aefso3602186b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686682847; x=1689274847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5pr0cmx8GdOoqGmwUpvVaewCy9R5ReTZjjT7UrosBk=;
        b=t3Ild6JOnZ5TrZ3X1J+R9RnGBgKvIgz5v5O9yX/gFT73bDQA0yqWfCCsEadkRUs0gj
         cue7FmYSmRV8RUGW9EL6wlNJtOMMeeRvzK3LmgqvxGCUKJz8vBNADRodGFGni7TJ1yI7
         YarLsk4VyIyw3nAnJCF5AR+uc5U0tn2R3jeIso4JPjnClmnhL/Mj9Wk4W7LqzX/y9YXi
         2vbrgP1e/24qmiyg3VaX56EF4xdng+cZ/C6mJ5NcyONNujvTCCM95UvYRiXd9n1vkUWC
         lJE+1eYIN2CHoo9cepZJ52GDSLw6ad8Cyx1xuq/JVlVxEdGxO3DElLoNDoI4r8G7J/Bz
         UjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686682847; x=1689274847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5pr0cmx8GdOoqGmwUpvVaewCy9R5ReTZjjT7UrosBk=;
        b=RnQPG7vED2td5/FEgIOYw2VdXyFTpcOjWKV3Bs0WYH0ZOHzNu/4jGoHvpnmR1RuOys
         8sxuGF1/VAgb6HTfOO5amYvXDy1zccsNoZj1DwSBBcCE7b0dorsuWiQfLiUVJgL4b5r7
         xFvWLcKU1H5AahQQW0lKB1QbNutxetMqOGvpTiJqCybTM4EPnhANjUEdwx45B20dSE43
         1Awi4g2abkRQDp6W5rQephDv7eUcz8tCW1U31eSCfoOWmaD+BkR+qj4Eo77XFKFhblNK
         8iQCl9RatdSovIRf6u4zkW3o0PVBOc3x5G/WTIFsfFBMO4cJl7hYyI6RLTLR+oWcMFYZ
         vtHg==
X-Gm-Message-State: AC+VfDzOY8uap3POsKPgHJPLlNd8GmBbhpVb+mFY0MQYPKVwx2+BI/2F
	Tf7/HIaVRmzx5qpNRgGnoWTlb38j8SC54oP62QTT+w==
X-Google-Smtp-Source: ACHHUZ7Lfo2TxCvqh4lq8AtnMfywQrG/xw343AAJ7qWQI+F/iZ+9H/FB/J4I2LcfhOvRxfehXTRSWFJyM/pXbLpetJg=
X-Received: by 2002:aca:b544:0:b0:397:98dd:b8fc with SMTP id
 e65-20020acab544000000b0039798ddb8fcmr8352198oif.38.1686682847226; Tue, 13
 Jun 2023 12:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612172307.3923165-4-sdf@google.com> <202306130953.PG26Cgga-lkp@intel.com>
In-Reply-To: <202306130953.PG26Cgga-lkp@intel.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Tue, 13 Jun 2023 12:00:34 -0700
Message-ID: <CAKH8qBteD2vkdyy1gQbXtV2hnLgGEGrkGcSo7424XzABOZhyqQ@mail.gmail.com>
Subject: Re: [RFC bpf-next 3/7] bpf: implement devtx hook points
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 7:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Stanislav,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Fomichev=
/bpf-rename-some-xdp-metadata-functions-into-dev-bound/20230613-012928
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230612172307.3923165-4-sdf%40g=
oogle.com
> patch subject: [RFC bpf-next 3/7] bpf: implement devtx hook points
> config: i386-randconfig-r016-20230612 (https://download.01.org/0day-ci/ar=
chive/20230613/202306130953.PG26Cgga-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build):
>         git remote add bpf-next https://git.kernel.org/pub/scm/linux/kern=
el/git/bpf/bpf-next.git
>         git fetch bpf-next master
>         git checkout bpf-next/master
>         b4 shazam https://lore.kernel.org/r/20230612172307.3923165-4-sdf@=
google.com
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306130953.PG26Cgga-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: net/core/dev.o: in function `unregister_netdevice_many_notify':
> >> net/core/dev.c:10879: undefined reference to `devtx_shutdown'
>

(haven't tested all weird configs yet, added to my todo list)


> vim +10879 net/core/dev.c
>
>  10826
>  10827  void unregister_netdevice_many_notify(struct list_head *head,
>  10828                                        u32 portid, const struct nl=
msghdr *nlh)
>  10829  {
>  10830          struct net_device *dev, *tmp;
>  10831          LIST_HEAD(close_head);
>  10832
>  10833          BUG_ON(dev_boot_phase);
>  10834          ASSERT_RTNL();
>  10835
>  10836          if (list_empty(head))
>  10837                  return;
>  10838
>  10839          list_for_each_entry_safe(dev, tmp, head, unreg_list) {
>  10840                  /* Some devices call without registering
>  10841                   * for initialization unwind. Remove those
>  10842                   * devices and proceed with the remaining.
>  10843                   */
>  10844                  if (dev->reg_state =3D=3D NETREG_UNINITIALIZED) {
>  10845                          pr_debug("unregister_netdevice: device %s=
/%p never was registered\n",
>  10846                                   dev->name, dev);
>  10847
>  10848                          WARN_ON(1);
>  10849                          list_del(&dev->unreg_list);
>  10850                          continue;
>  10851                  }
>  10852                  dev->dismantle =3D true;
>  10853                  BUG_ON(dev->reg_state !=3D NETREG_REGISTERED);
>  10854          }
>  10855
>  10856          /* If device is running, close it first. */
>  10857          list_for_each_entry(dev, head, unreg_list)
>  10858                  list_add_tail(&dev->close_list, &close_head);
>  10859          dev_close_many(&close_head, true);
>  10860
>  10861          list_for_each_entry(dev, head, unreg_list) {
>  10862                  /* And unlink it from device chain. */
>  10863                  write_lock(&dev_base_lock);
>  10864                  unlist_netdevice(dev, false);
>  10865                  dev->reg_state =3D NETREG_UNREGISTERING;
>  10866                  write_unlock(&dev_base_lock);
>  10867          }
>  10868          flush_all_backlogs();
>  10869
>  10870          synchronize_net();
>  10871
>  10872          list_for_each_entry(dev, head, unreg_list) {
>  10873                  struct sk_buff *skb =3D NULL;
>  10874
>  10875                  /* Shutdown queueing discipline. */
>  10876                  dev_shutdown(dev);
>  10877
>  10878                  dev_xdp_uninstall(dev);
>  10879                  devtx_shutdown(dev);
>  10880                  bpf_dev_bound_netdev_unregister(dev);
>  10881
>  10882                  netdev_offload_xstats_disable_all(dev);
>  10883
>  10884                  /* Notify protocols, that we are about to destroy
>  10885                   * this device. They should clean all the things.
>  10886                   */
>  10887                  call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
>  10888
>  10889                  if (!dev->rtnl_link_ops ||
>  10890                      dev->rtnl_link_state =3D=3D RTNL_LINK_INITIAL=
IZED)
>  10891                          skb =3D rtmsg_ifinfo_build_skb(RTM_DELLIN=
K, dev, ~0U, 0,
>  10892                                                       GFP_KERNEL, =
NULL, 0,
>  10893                                                       portid, nlh)=
;
>  10894
>  10895                  /*
>  10896                   *      Flush the unicast and multicast chains
>  10897                   */
>  10898                  dev_uc_flush(dev);
>  10899                  dev_mc_flush(dev);
>  10900
>  10901                  netdev_name_node_alt_flush(dev);
>  10902                  netdev_name_node_free(dev->name_node);
>  10903
>  10904                  call_netdevice_notifiers(NETDEV_PRE_UNINIT, dev);
>  10905
>  10906                  if (dev->netdev_ops->ndo_uninit)
>  10907                          dev->netdev_ops->ndo_uninit(dev);
>  10908
>  10909                  if (skb)
>  10910                          rtmsg_ifinfo_send(skb, dev, GFP_KERNEL, p=
ortid, nlh);
>  10911
>  10912                  /* Notifier chain MUST detach us all upper device=
s. */
>  10913                  WARN_ON(netdev_has_any_upper_dev(dev));
>  10914                  WARN_ON(netdev_has_any_lower_dev(dev));
>  10915
>  10916                  /* Remove entries from kobject tree */
>  10917                  netdev_unregister_kobject(dev);
>  10918  #ifdef CONFIG_XPS
>  10919                  /* Remove XPS queueing entries */
>  10920                  netif_reset_xps_queues_gt(dev, 0);
>  10921  #endif
>  10922          }
>  10923
>  10924          synchronize_net();
>  10925
>  10926          list_for_each_entry(dev, head, unreg_list) {
>  10927                  netdev_put(dev, &dev->dev_registered_tracker);
>  10928                  net_set_todo(dev);
>  10929          }
>  10930
>  10931          list_del(head);
>  10932  }
>  10933
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
