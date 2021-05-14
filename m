Content-Type: multipart/mixed; boundary="===============0897992684197871531=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:3598 mlxsw_sp_nexthop_group_refresh() warn: missing error code 'err'
Date: Fri, 14 May 2021 17:35:00 +0300
Message-ID: <202105141823.Td2h3Mbi-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0897992684197871531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   315d99318179b9cd5077ccc9f7f26a164c9fa998
commit: e3ddfb45bacdc623eedea7f7bf9e7879257471d6 mlxsw: spectrum_router: Al=
low returning errors from mlxsw_sp_nexthop_group_refresh()
config: x86_64-randconfig-m031-20210514 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:3598 mlxsw_sp_nexthop=
_group_refresh() warn: missing error code 'err'

vim +/err +3598 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c

e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3555  static int
a7ff87acd995e3 Jiri Pirko         2016-07-05  3556  mlxsw_sp_nexthop_group_=
refresh(struct mlxsw_sp *mlxsw_sp,
a7ff87acd995e3 Jiri Pirko         2016-07-05  3557  			       struct mlxsw_=
sp_nexthop_group *nh_grp)
a7ff87acd995e3 Jiri Pirko         2016-07-05  3558  {
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3559  	struct mlxsw_sp_nextho=
p_group_info *nhgi =3D nh_grp->nhgi;
eb789980d0aa6c Ido Schimmel       2017-10-22  3560  	u16 ecmp_size, old_ecm=
p_size;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3561  	struct mlxsw_sp_nextho=
p *nh;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3562  	bool offload_change =
=3D false;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3563  	u32 adj_index;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3564  	bool old_adj_index_val=
id;
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3565  	int i, err2, err =3D 0;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3566  	u32 old_adj_index;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3567  =

7f7a417e6a11d7 Ido Schimmel       2020-11-13  3568  	if (!nhgi->gateway) {
b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3569  		mlxsw_sp_nexthop_fib_=
entries_update(mlxsw_sp, nh_grp);
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3570  		return 0;
b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3571  	}
b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3572  =

7f7a417e6a11d7 Ido Schimmel       2020-11-13  3573  	for (i =3D 0; i < nhgi=
->count; i++) {
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3574  		nh =3D &nhgi->nexthop=
s[i];
a7ff87acd995e3 Jiri Pirko         2016-07-05  3575  =

56b8a9ed276bc1 Petr Machata       2017-07-31  3576  		if (nh->should_offloa=
d !=3D nh->offloaded) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3577  			offload_change =3D t=
rue;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3578  			if (nh->should_offlo=
ad)
a7ff87acd995e3 Jiri Pirko         2016-07-05  3579  				nh->update =3D 1;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3580  		}
a7ff87acd995e3 Jiri Pirko         2016-07-05  3581  	}
a7ff87acd995e3 Jiri Pirko         2016-07-05  3582  	if (!offload_change) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3583  		/* Nothing was added =
or removed, so no need to reallocate. Just
a7ff87acd995e3 Jiri Pirko         2016-07-05  3584  		 * update MAC on exis=
ting adjacency indexes.
a7ff87acd995e3 Jiri Pirko         2016-07-05  3585  		 */
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3586  		err =3D mlxsw_sp_next=
hop_group_update(mlxsw_sp, nhgi, false);
a7ff87acd995e3 Jiri Pirko         2016-07-05  3587  		if (err) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3588  			dev_warn(mlxsw_sp->b=
us_info->dev, "Failed to update neigh MAC in adjacency table.\n");
a7ff87acd995e3 Jiri Pirko         2016-07-05  3589  			goto set_trap;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3590  		}
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3591  		return 0;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3592  	}
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3593  	mlxsw_sp_nexthop_group=
_normalize(nhgi);
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3594  	if (!nhgi->sum_norm_we=
ight)
a7ff87acd995e3 Jiri Pirko         2016-07-05  3595  		/* No neigh of this g=
roup is connected so we just set
a7ff87acd995e3 Jiri Pirko         2016-07-05  3596  		 * the trap and let e=
verthing flow through kernel.
a7ff87acd995e3 Jiri Pirko         2016-07-05  3597  		 */
a7ff87acd995e3 Jiri Pirko         2016-07-05 @3598  		goto set_trap;

The comments sort of imply that this is a success path so no error
code necessary.  It's sort of hard to be positive though...

a7ff87acd995e3 Jiri Pirko         2016-07-05  3599  =

7f7a417e6a11d7 Ido Schimmel       2020-11-13  3600  	ecmp_size =3D nhgi->su=
m_norm_weight;
425a08c67317ac Ido Schimmel       2017-10-22  3601  	err =3D mlxsw_sp_fix_a=
dj_grp_size(mlxsw_sp, &ecmp_size);
425a08c67317ac Ido Schimmel       2017-10-22  3602  	if (err)
425a08c67317ac Ido Schimmel       2017-10-22  3603  		/* No valid allocatio=
n size available. */
425a08c67317ac Ido Schimmel       2017-10-22  3604  		goto set_trap;
425a08c67317ac Ido Schimmel       2017-10-22  3605  =

4b6b18692aec20 Jiri Pirko         2018-07-08  3606  	err =3D mlxsw_sp_kvdl_=
alloc(mlxsw_sp, MLXSW_SP_KVDL_ENTRY_TYPE_ADJ,
4b6b18692aec20 Jiri Pirko         2018-07-08  3607  				  ecmp_size, &adj_i=
ndex);
1312444374241f Arkadi Sharshevsky 2017-03-25  3608  	if (err) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3609  		/* We ran out of KVD =
linear space, just set the
a7ff87acd995e3 Jiri Pirko         2016-07-05  3610  		 * trap and let every=
thing flow through kernel.
a7ff87acd995e3 Jiri Pirko         2016-07-05  3611  		 */
a7ff87acd995e3 Jiri Pirko         2016-07-05  3612  		dev_warn(mlxsw_sp->bu=
s_info->dev, "Failed to allocate KVD linear area for nexthop group.\n");
a7ff87acd995e3 Jiri Pirko         2016-07-05  3613  		goto set_trap;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3614  	}
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3615  	old_adj_index_valid =
=3D nhgi->adj_index_valid;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3616  	old_adj_index =3D nhgi=
->adj_index;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3617  	old_ecmp_size =3D nhgi=
->ecmp_size;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3618  	nhgi->adj_index_valid =
=3D 1;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3619  	nhgi->adj_index =3D ad=
j_index;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3620  	nhgi->ecmp_size =3D ec=
mp_size;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3621  	mlxsw_sp_nexthop_group=
_rebalance(nhgi);
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3622  	err =3D mlxsw_sp_nexth=
op_group_update(mlxsw_sp, nhgi, true);
a7ff87acd995e3 Jiri Pirko         2016-07-05  3623  	if (err) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3624  		dev_warn(mlxsw_sp->bu=
s_info->dev, "Failed to update neigh MAC in adjacency table.\n");
a7ff87acd995e3 Jiri Pirko         2016-07-05  3625  		goto set_trap;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3626  	}
a7ff87acd995e3 Jiri Pirko         2016-07-05  3627  =

8c5a5b9b9185e5 Ido Schimmel       2020-01-14  3628  	mlxsw_sp_nexthop_group=
_offload_refresh(mlxsw_sp, nh_grp);
8c5a5b9b9185e5 Ido Schimmel       2020-01-14  3629  =

a7ff87acd995e3 Jiri Pirko         2016-07-05  3630  	if (!old_adj_index_val=
id) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3631  		/* The trap was set f=
or fib entries, so we have to call
a7ff87acd995e3 Jiri Pirko         2016-07-05  3632  		 * fib entry update t=
o unset it and use adjacency index.
a7ff87acd995e3 Jiri Pirko         2016-07-05  3633  		 */
a7ff87acd995e3 Jiri Pirko         2016-07-05  3634  		err =3D mlxsw_sp_next=
hop_fib_entries_update(mlxsw_sp, nh_grp);
a7ff87acd995e3 Jiri Pirko         2016-07-05  3635  		if (err) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3636  			dev_warn(mlxsw_sp->b=
us_info->dev, "Failed to add adjacency index to fib entries.\n");
a7ff87acd995e3 Jiri Pirko         2016-07-05  3637  			goto set_trap;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3638  		}
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3639  		return 0;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3640  	}
a7ff87acd995e3 Jiri Pirko         2016-07-05  3641  =

a7ff87acd995e3 Jiri Pirko         2016-07-05  3642  	err =3D mlxsw_sp_adj_i=
ndex_mass_update(mlxsw_sp, nh_grp,
a7ff87acd995e3 Jiri Pirko         2016-07-05  3643  					     old_adj_index=
, old_ecmp_size);
4b6b18692aec20 Jiri Pirko         2018-07-08  3644  	mlxsw_sp_kvdl_free(mlx=
sw_sp, MLXSW_SP_KVDL_ENTRY_TYPE_ADJ,
0304c00546fce7 Jiri Pirko         2018-07-08  3645  			   old_ecmp_size, ol=
d_adj_index);
a7ff87acd995e3 Jiri Pirko         2016-07-05  3646  	if (err) {
a7ff87acd995e3 Jiri Pirko         2016-07-05  3647  		dev_warn(mlxsw_sp->bu=
s_info->dev, "Failed to mass-update adjacency index for nexthop group.\n");
a7ff87acd995e3 Jiri Pirko         2016-07-05  3648  		goto set_trap;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3649  	}
77d964e66cfad0 Ido Schimmel       2017-08-02  3650  =

e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3651  	return 0;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3652  =

a7ff87acd995e3 Jiri Pirko         2016-07-05  3653  set_trap:
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3654  	old_adj_index_valid =
=3D nhgi->adj_index_valid;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3655  	nhgi->adj_index_valid =
=3D 0;
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3656  	for (i =3D 0; i < nhgi=
->count; i++) {
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3657  		nh =3D &nhgi->nexthop=
s[i];
a7ff87acd995e3 Jiri Pirko         2016-07-05  3658  		nh->offloaded =3D 0;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3659  	}
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3660  	err2 =3D mlxsw_sp_next=
hop_fib_entries_update(mlxsw_sp, nh_grp);
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3661  	if (err2)
a7ff87acd995e3 Jiri Pirko         2016-07-05  3662  		dev_warn(mlxsw_sp->bu=
s_info->dev, "Failed to set traps for fib entries.\n");
8c5a5b9b9185e5 Ido Schimmel       2020-01-14  3663  	mlxsw_sp_nexthop_group=
_offload_refresh(mlxsw_sp, nh_grp);
a7ff87acd995e3 Jiri Pirko         2016-07-05  3664  	if (old_adj_index_vali=
d)
4b6b18692aec20 Jiri Pirko         2018-07-08  3665  		mlxsw_sp_kvdl_free(ml=
xsw_sp, MLXSW_SP_KVDL_ENTRY_TYPE_ADJ,
7f7a417e6a11d7 Ido Schimmel       2020-11-13  3666  				   nhgi->ecmp_size,=
 nhgi->adj_index);
e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3667  	return err;
a7ff87acd995e3 Jiri Pirko         2016-07-05  3668  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0897992684197871531==--

