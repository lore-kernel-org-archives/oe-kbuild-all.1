Content-Type: multipart/mixed; boundary="===============7847460121615355001=="
MIME-Version: 1.0
From: Steve French <smfrench@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [cifs:for-next 31/31] fs/cifs/smb2ops.c:3047:14: warning: variable 'err_iov' set but not used
Date: Fri, 23 Oct 2020 08:32:21 -0500
Message-ID: <CAH2r5mt+dC1Q3rpBYjsBNcRdxRLXzB3yb5+2cXZ+bZ4CiipKFw@mail.gmail.com>
In-Reply-To: <202010231518.dwGdVVdP-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7847460121615355001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

fixed - and patch to remove the unused variable added to cifs-2.6.git for-n=
ext

On Fri, Oct 23, 2020 at 3:15 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
> head:   3d15f3db17ec6bd0bb8c73b2e38bd4e0e8ba0066
> commit: 3d15f3db17ec6bd0bb8c73b2e38bd4e0e8ba0066 [31/31] smb3: add suppor=
t for stat of WSL reparse points for special file types
> config: ia64-randconfig-r035-20201022 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
>         git fetch --no-tags cifs for-next
>         git checkout 3d15f3db17ec6bd0bb8c73b2e38bd4e0e8ba0066
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dia64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/ia64/include/asm/pgtable.h:154,
>                     from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:33,
>                     from include/linux/pagemap.h:8,
>                     from fs/cifs/smb2ops.c:8:
>    arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
>    arch/ia64/include/asm/mmu_context.h:137:41: warning: variable 'old_rr4=
' set but not used [-Wunused-but-set-variable]
>      137 |  unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
>          |                                         ^~~~~~~
>    fs/cifs/smb2ops.c: In function 'smb2_query_reparse_tag':
> >> fs/cifs/smb2ops.c:3047:14: warning: variable 'err_iov' set but not use=
d [-Wunused-but-set-variable]
>     3047 |  struct kvec err_iov =3D {NULL, 0};
>          |              ^~~~~~~
>
> vim +/err_iov +3047 fs/cifs/smb2ops.c
>
>   3036
>   3037  int
>   3038  smb2_query_reparse_tag(const unsigned int xid, struct cifs_tcon *=
tcon,
>   3039                     struct cifs_sb_info *cifs_sb, const char *full=
_path,
>   3040                     __u32 *tag)
>   3041  {
>   3042          int rc;
>   3043          __le16 *utf16_path =3D NULL;
>   3044          __u8 oplock =3D SMB2_OPLOCK_LEVEL_NONE;
>   3045          struct cifs_open_parms oparms;
>   3046          struct cifs_fid fid;
> > 3047          struct kvec err_iov =3D {NULL, 0};
>   3048          struct TCP_Server_Info *server =3D cifs_pick_channel(tcon=
->ses);
>   3049          int flags =3D 0;
>   3050          struct smb_rqst rqst[3];
>   3051          int resp_buftype[3];
>   3052          struct kvec rsp_iov[3];
>   3053          struct kvec open_iov[SMB2_CREATE_IOV_SIZE];
>   3054          struct kvec io_iov[SMB2_IOCTL_IOV_SIZE];
>   3055          struct kvec close_iov[1];
>   3056          struct smb2_create_rsp *create_rsp;
>   3057          struct smb2_ioctl_rsp *ioctl_rsp;
>   3058          struct reparse_data_buffer *reparse_buf;
>   3059          u32 plen;
>   3060
>   3061          cifs_dbg(FYI, "%s: path: %s\n", __func__, full_path);
>   3062
>   3063          if (smb3_encryption_required(tcon))
>   3064                  flags |=3D CIFS_TRANSFORM_REQ;
>   3065
>   3066          memset(rqst, 0, sizeof(rqst));
>   3067          resp_buftype[0] =3D resp_buftype[1] =3D resp_buftype[2] =
=3D CIFS_NO_BUFFER;
>   3068          memset(rsp_iov, 0, sizeof(rsp_iov));
>   3069
>   3070          utf16_path =3D cifs_convert_path_to_utf16(full_path, cifs=
_sb);
>   3071          if (!utf16_path)
>   3072                  return -ENOMEM;
>   3073
>   3074          /*
>   3075           * setup smb2open - TODO add optimization to call cifs_ge=
t_readable_path
>   3076           * to see if there is a handle already open that we can u=
se
>   3077           */
>   3078          memset(&open_iov, 0, sizeof(open_iov));
>   3079          rqst[0].rq_iov =3D open_iov;
>   3080          rqst[0].rq_nvec =3D SMB2_CREATE_IOV_SIZE;
>   3081
>   3082          memset(&oparms, 0, sizeof(oparms));
>   3083          oparms.tcon =3D tcon;
>   3084          oparms.desired_access =3D FILE_READ_ATTRIBUTES;
>   3085          oparms.disposition =3D FILE_OPEN;
>   3086          oparms.create_options =3D cifs_create_options(cifs_sb, OP=
EN_REPARSE_POINT);
>   3087          oparms.fid =3D &fid;
>   3088          oparms.reconnect =3D false;
>   3089
>   3090          rc =3D SMB2_open_init(tcon, server,
>   3091                              &rqst[0], &oplock, &oparms, utf16_pat=
h);
>   3092          if (rc)
>   3093                  goto query_rp_exit;
>   3094          smb2_set_next_command(tcon, &rqst[0]);
>   3095
>   3096
>   3097          /* IOCTL */
>   3098          memset(&io_iov, 0, sizeof(io_iov));
>   3099          rqst[1].rq_iov =3D io_iov;
>   3100          rqst[1].rq_nvec =3D SMB2_IOCTL_IOV_SIZE;
>   3101
>   3102          rc =3D SMB2_ioctl_init(tcon, server,
>   3103                               &rqst[1], fid.persistent_fid,
>   3104                               fid.volatile_fid, FSCTL_GET_REPARSE_=
POINT,
>   3105                               true /* is_fctl */, NULL, 0,
>   3106                               CIFSMaxBufSize -
>   3107                               MAX_SMB2_CREATE_RESPONSE_SIZE -
>   3108                               MAX_SMB2_CLOSE_RESPONSE_SIZE);
>   3109          if (rc)
>   3110                  goto query_rp_exit;
>   3111
>   3112          smb2_set_next_command(tcon, &rqst[1]);
>   3113          smb2_set_related(&rqst[1]);
>   3114
>   3115
>   3116          /* Close */
>   3117          memset(&close_iov, 0, sizeof(close_iov));
>   3118          rqst[2].rq_iov =3D close_iov;
>   3119          rqst[2].rq_nvec =3D 1;
>   3120
>   3121          rc =3D SMB2_close_init(tcon, server,
>   3122                               &rqst[2], COMPOUND_FID, COMPOUND_FID=
, false);
>   3123          if (rc)
>   3124                  goto query_rp_exit;
>   3125
>   3126          smb2_set_related(&rqst[2]);
>   3127
>   3128          rc =3D compound_send_recv(xid, tcon->ses, server,
>   3129                                  flags, 3, rqst,
>   3130                                  resp_buftype, rsp_iov);
>   3131
>   3132          create_rsp =3D rsp_iov[0].iov_base;
>   3133          if (create_rsp && create_rsp->sync_hdr.Status)
>   3134                  err_iov =3D rsp_iov[0];
>   3135          ioctl_rsp =3D rsp_iov[1].iov_base;
>   3136
>   3137          /*
>   3138           * Open was successful and we got an ioctl response.
>   3139           */
>   3140          if (rc =3D=3D 0) {
>   3141                  /* See MS-FSCC 2.3.23 */
>   3142
>   3143                  reparse_buf =3D (struct reparse_data_buffer *)
>   3144                          ((char *)ioctl_rsp +
>   3145                           le32_to_cpu(ioctl_rsp->OutputOffset));
>   3146                  plen =3D le32_to_cpu(ioctl_rsp->OutputCount);
>   3147
>   3148                  if (plen + le32_to_cpu(ioctl_rsp->OutputOffset) >
>   3149                      rsp_iov[1].iov_len) {
>   3150                          cifs_tcon_dbg(FYI, "srv returned invalid =
ioctl len: %d\n",
>   3151                                   plen);
>   3152                          rc =3D -EIO;
>   3153                          goto query_rp_exit;
>   3154                  }
>   3155                  *tag =3D le32_to_cpu(reparse_buf->ReparseTag);
>   3156          }
>   3157
>   3158   query_rp_exit:
>   3159          kfree(utf16_path);
>   3160          SMB2_open_free(&rqst[0]);
>   3161          SMB2_ioctl_free(&rqst[1]);
>   3162          SMB2_close_free(&rqst[2]);
>   3163          free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
>   3164          free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
>   3165          free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
>   3166          return rc;
>   3167  }
>   3168
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Thanks,

Steve
--===============7847460121615355001==--

